import 'dart:async';
import 'dart:developer';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:revive/core/network/supabase/database/get_stream_data.dart';
import 'package:revive/features/company/redeem/models/redeem_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'buy_redeem_state.dart';

class BuyRedeemCubit extends Cubit<BuyRedeemState> {
  BuyRedeemCubit() : super(BuyRedeemInitial()) {
    getCompanyRedeems();
  }

  StreamSubscription? streamSubscription;
  List<RedeemModel> redeemList = [];
  final supabase = getIt.get<SupabaseClient>();

  int retryCount = 0;
  final int maxRetries = 3;

  getCompanyRedeems() {
    streamSubscription?.cancel();
    emit(BuyRedeemLoading());

    try {
      streamSubscription = streamData(
        tableName: "redeems",
      ).listen(
        (event) {
          if (event.isNotEmpty) {
            redeemList = event.map((e) => RedeemModel.fromJson(e)).toList();
            emit(BuyRedeemSuccess());
            retryCount = 0;
          } else {
            redeemList = [];
            emit(BuyRedeemSuccess());
            retryCount = 0;
          }
        },
        onError: (error) async {
          if (retryCount < maxRetries) {
            retryCount++;
            emit(BuyRedeemLoading());
            await Future.delayed(Duration(seconds: 2));
            getCompanyRedeems();
          } else {
            emit(BuyRedeemFailure(
                errorMessage: "Failed to load data after $maxRetries retries"));
          }
        },
      );
    } catch (e) {
      if (retryCount < maxRetries) {
        retryCount++;
        emit(BuyRedeemLoading());
        Future.delayed(Duration(seconds: 2), () => getCompanyRedeems());
      } else {
        emit(BuyRedeemFailure(
            errorMessage: "Failed to load data after $maxRetries retries"));
      }
    }
  }

  //!
  buyRedeem({
    required double redeemPrice,
  }) async {
    try {
      emit(CheckPoints());
      final response = await supabase
          .from("customerss")
          .select("voucher")
          .eq("id", getIt<SupabaseClient>().auth.currentUser!.id)
          .single();
      double updatedVoucher = response["voucher"].toDouble() - redeemPrice;
      if (updatedVoucher >= 0) {
        await supabase
            .from("customerss")
            .update({"voucher": updatedVoucher}).eq(
                "id", getIt<SupabaseClient>().auth.currentUser!.id);
        emit(EnoughPoints());
      } else {
        emit(NotEnoughPoints(
            errorMessage:
                "Not enough points to buy this redeem\n Please try another redeem\nredeem points: $redeemPrice - your points: ${response["voucher"]}"));
      }
    } catch (e) {
      emit(BuyRedeemFailure(errorMessage: e.toString()));
    }
  }
}
