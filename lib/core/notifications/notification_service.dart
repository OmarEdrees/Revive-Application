import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:revive/core/cache/cache_helper.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:revive/core/helper/show_custom_dialog.dart';
import 'package:revive/core/network/supabase/database/get_stream_data_with_spcific_id.dart';
import 'package:revive/features/auth/sign_in/models/user_model.dart';
import 'package:revive/features/customer/profile/models/voucher_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationService {
  StreamSubscription? subscription;
  int retryCount = 0;
  final int maxRetries = 3;

void listenToRecycleRequests() {
  subscription?.cancel();

  final user = getIt<SupabaseClient>().auth.currentUser;
  if (user == null) {
    return;
  }

  subscription = streamDataWithSpecificId(
    tableName: "vouchers",
    primaryKey: "user_id",
    id: user.id,
  ).listen(
    (data) async {
      if (data.isNotEmpty) {
        final vouchers = data.map((e) => VoucherModel.fromJson(e)).toList();
        final unreadVouchers =
            vouchers.where((v) => v.read == false).toList();
        if (unreadVouchers.isNotEmpty) {
          for (var voucher in unreadVouchers) {
            showCustomDialog(
              title: "Congrats",
              description: "You have a new voucher : ${voucher.voucher}",
              dialogType: DialogType.noHeader,
            );
            PostgrestMap data = await updateVoucher(voucher);
            await updateUserModel(data, voucher);
          }
        }
      }
    },
    onError: (error) {
      retryCount++;
      if (retryCount < maxRetries) {
        listenToRecycleRequests();
      } else {
        print("❌ فشل الإشتراك في الطلبات: $error");
      }
    },
  );
}

  Future<PostgrestMap> updateVoucher(VoucherModel voucher) async {
    await getIt<SupabaseClient>()
        .from("vouchers")
        .update({"read": true}).eq("id", voucher.id);
    var data = await getIt<SupabaseClient>()
        .from("customerss")
        .select()
        .eq(
          'id',
          getIt<SupabaseClient>().auth.currentUser!.id,
        )
        .single();
    await getIt<SupabaseClient>()
        .from("customerss")
        .update({"voucher": data["voucher"] + voucher.voucher}).eq(
            "id", getIt<SupabaseClient>().auth.currentUser!.id);
    return data;
  }

  Future<void> updateUserModel(PostgrestMap data, VoucherModel voucher) async {
    var userDataAfterUpdate = await getIt<SupabaseClient>()
        .from("customerss")
        .select()
        .eq(
          'id',
          getIt<SupabaseClient>().auth.currentUser!.id,
        )
        .single();
    await getIt<CacheHelper>()
        .saveUserModel(UserModel.fromJson(userDataAfterUpdate));
  }

  void dispose() {
    subscription?.cancel();
  }
}
