import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:revive/core/network/supabase/database/add_data.dart';
import 'package:revive/core/network/supabase/database/get_stream_data_with_spcific_id.dart';
import 'package:revive/features/company/redeem/models/redeem_model.dart';
import 'package:revive/generated/locale_keys.g.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'redeem_state.dart';

class RedeemCubit extends Cubit<RedeemState> {
  RedeemCubit() : super(RedeemLoading()) {
    getCompanyRedeems();
  }

  StreamSubscription? streamSubscription;
  List<RedeemModel> redeemList = [];
  final redeemNameController = TextEditingController();
  final redeemPriceController = TextEditingController();
  final redeemDescriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final supabase = getIt.get<SupabaseClient>();

  int retryCount = 0;
  final int maxRetries = 3;

  getCompanyRedeems() {
    streamSubscription?.cancel();
    emit(RedeemLoading());

    try {
      streamSubscription = streamDataWithSpecificId(
        tableName: "redeems",
        id: supabase.auth.currentUser!.id,
        primaryKey: "company_id",
      ).listen(
        (event) {
          if (event.isNotEmpty) {
            redeemList = event.map((e) => RedeemModel.fromJson(e)).toList();
            emit(RedeemSuccess());
            retryCount = 0;
          } else {
            emit(RedeemFailure(
                errorMessage: LocaleKeys.Redeem_NoRedeemsFound.tr()));
            retryCount = 0;
          }
        },
        onError: (error) async {
          if (retryCount < maxRetries) {
            retryCount++;
            emit(RedeemLoading());
            await Future.delayed(Duration(seconds: 2));
            getCompanyRedeems();
          } else {
            emit(RedeemFailure(
                errorMessage: "Failed to load data after $maxRetries retries"));
          }
        },
      );
    } catch (e) {
      if (retryCount < maxRetries) {
        retryCount++;
        emit(RedeemLoading());
        Future.delayed(Duration(seconds: 2), () => getCompanyRedeems());
      } else {
        emit(RedeemFailure(
            errorMessage: "Failed to load data after $maxRetries retries"));
      }
    }
  }

  addRedeem() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(RedeemLoading());
        await addData(tableName: "redeems", data: {
          "company_id": supabase.auth.currentUser!.id,
          "name": redeemNameController.text,
          "price": redeemPriceController.text,
          "description": redeemDescriptionController.text,
        });
        redeemNameController.clear();
        redeemPriceController.clear();
        redeemDescriptionController.clear();
        emit(RedeemSuccess());
        getCompanyRedeems();
      } on Exception catch (e) {
        emit(RedeemFailure(errorMessage: e.toString()));
      }
    }
  }

  deleteRedeem({required String id}) async {
    try {
      emit(RedeemLoading());
      await supabase.from("redeems").delete().eq("id", id);
      getCompanyRedeems();
    } catch (e) {
      emit(RedeemFailure(errorMessage: e.toString()));
    }
  }
}
