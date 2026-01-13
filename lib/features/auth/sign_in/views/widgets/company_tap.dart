import 'package:easy_localization/easy_localization.dart';
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
import 'package:revive/generated/locale_keys.g.dart';

class CompanyTab extends StatelessWidget {
  const CompanyTab({super.key, required this.cubit});
  final SignInCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.companyFormKey,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormFieldWithTitle(
                hintText: LocaleKeys.signIn_hintTextEmailCompany.tr(),
                title: LocaleKeys.signIn_titleEmailCompany.tr(),
                controller: cubit.companyEmailController,
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              CustomTextFormFieldWithTitle(
                hintText: LocaleKeys.signIn_hintTextPasswordCompany.tr(),
                title: LocaleKeys.signIn_titlePasswordCompany.tr(),
                isPassword: true,
                controller: cubit.companyPasswordController,
              ),
              ForgetPassword(),
              SizedBox(height: context.height * 0.015),
              BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  return state is SignInLoading
                      ? CustomLoading()
                      : CustomElevatedButton(
                          name: LocaleKeys.signIn_signIn.tr(),
                          onPressed: () {
                            cubit.signIn(
                              role: "Company",
                              email: cubit.companyEmailController.text,
                              password: cubit.companyPasswordController.text,
                            );
                          },
                          height: context.height * 0.07,
                          width: context.width * 0.8,
                        );
                },
              ),
              HaveAccountOrNot(
                title: LocaleKeys.signIn_HaveAccount.tr(),
                btnText: LocaleKeys.signIn_signUp.tr(),
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
