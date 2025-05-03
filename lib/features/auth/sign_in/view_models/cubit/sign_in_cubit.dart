import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:revive/core/app_route/route_names.dart';
import 'package:revive/core/cache/cache_helper.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:revive/core/network/supabase/auth/sign_in_with_password.dart';
import 'package:revive/core/notifications/notification_service.dart';
import 'package:revive/features/auth/sign_in/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  // customer

  final customerEmailController = TextEditingController();
  final customerPasswordController = TextEditingController();
  final customerFormKey = GlobalKey<FormState>();

  // company
  final companyFormKey = GlobalKey<FormState>();
  final companyEmailController = TextEditingController();
  final companyPasswordController = TextEditingController();

  //! sign in with supabase
  signIn(
      {required String role,
      required String email,
      required String password}) async {
    if (role == "Customer"
        ? customerFormKey.currentState!.validate()
        : companyFormKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        var data = await getIt<SupabaseClient>()
            .from(role == "Customer" ? "customerss" : "companiess")
            .select()
            .eq("email", email)
            .maybeSingle();
        if (data == null) {
          emit(SelectDiffrentRole(role: role));
          return;
        }
        await signInWithPassword(
          email: email,
          password: password,
        );
        await getIt<CacheHelper>().saveData(
            key: "userRole",
            value: role == "Customer" ? "Customer" : "Company");
        if (role == "Customer") {
          await saveUserData();
          getIt<NotificationService>().listenToRecycleRequests();
        }
        emit(
          SignInSuccess(
              route: role == "Customer"
                  ? RouteNames.userHomeScreen
                  : RouteNames.companyHomeScreen),
        );
      } catch (e) {
        emit(
          SignInFailure(
            error: e.toString(),
          ),
        );
      }
    }
  }

  Future<void> saveUserData() async {
    var data = await getIt<SupabaseClient>()
        .from("customerss")
        .select()
        .eq('id', getIt<SupabaseClient>().auth.currentUser!.id)
        .single();
    await getIt<CacheHelper>().saveUserModel(UserModel.fromJson(data));
  }
}
