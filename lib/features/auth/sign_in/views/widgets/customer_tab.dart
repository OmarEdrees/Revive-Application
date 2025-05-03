import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/app_route/route_names.dart';
import 'package:revive/core/components/custom_elevated_button.dart';
import 'package:revive/core/components/custom_text_form_field_with_title.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/auth/sign_in/view_models/cubit/sign_in_cubit.dart';
import 'package:revive/features/auth/sign_in/views/widgets/custom_loading.dart';
import 'package:revive/features/auth/sign_in/views/widgets/forget_password.dart';
import 'package:revive/features/auth/sign_in/views/widgets/have_account_or_not.dart';

class CustomerTab extends StatelessWidget {
  const CustomerTab({super.key, required this.cubit});
  final SignInCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.customerFormKey,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormFieldWithTitle(
                hintText: "enter customer email",
                title: "Customer Email",
                controller: cubit.customerEmailController,
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              CustomTextFormFieldWithTitle(
                hintText: "enter customer password",
                title: "Customer Password",
                controller: cubit.customerPasswordController,
                isPassword: true,
              ),
              ForgetPassword(),
              SizedBox(height: context.height * 0.015),
              BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  return state is SignInLoading
                      ? CustomLoading()
                      : CustomElevatedButton(
                          name: "Sign In",
                          onPressed: () {
                            cubit.signIn(
                              role: "Customer",
                              email: cubit.customerEmailController.text,
                              password: cubit.customerPasswordController.text,
                            );
                          },
                          height: context.height * 0.07,
                          width: context.width * 0.8,
                        );
                },
              ),
              HaveAccountOrNot(
                title: "Don't have an account?",
                btnText: "Sign Up",
                onPressed: () {
                  context.pushScreen(RouteNames.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
