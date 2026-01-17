import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/di/dependancy_injection.dart';
import 'package:revive/core/network/supabase/auth/sign_up_with_password.dart';
import 'package:revive/core/network/supabase/database/add_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  // company
  final companyNameController = TextEditingController();
  final companyEmailController = TextEditingController();
  final companyPasswordController = TextEditingController();
  final companyAddressController = TextEditingController();
  final companyIndustryController = TextEditingController();
  final companyFormKey = GlobalKey<FormState>();
  // customer
  final customerNameController = TextEditingController();
  final customerEmailController = TextEditingController();
  final customerPasswordController = TextEditingController();
  final customerAddressController = TextEditingController();
  final customerFormKey = GlobalKey<FormState>();
  //! sign up with supabase
  signUp({
    required String role,
    required String name,
    required String email,
    required String password,
    required String address,
  }) async {
    if (role == "Customer"
        ? customerFormKey.currentState!.validate()
        : companyFormKey.currentState!.validate()) {
      if (role != "Customer" && companyIndustryController.text.isEmpty) {
        emit(SelectIndustry());
        return;
      }
      try {
        emit(SignUpLoading());
        log(email);
        await signUpWithPassword(email: email, password: password);
        await addData(
          tableName: role == "Customer" ? "customerss" : "companiess",
          data: {
            "id": getIt<SupabaseClient>().auth.currentUser!.id,
            "name": name,
            "email": email,
            "address": address,
            if (role != "Customer") "industry": companyIndustryController.text
          },
        );
        emit(SignUpSuccess());
      } catch (e) {
        log("===============================$e");
        emit(
          SignUpFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
