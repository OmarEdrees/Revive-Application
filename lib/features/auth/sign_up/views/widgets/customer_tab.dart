import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/components/custom_elevated_button.dart';
import 'package:revive/core/components/custom_text_form_field_with_title.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/auth/sign_in/views/widgets/custom_loading.dart';
import 'package:revive/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:revive/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';
import 'package:revive/generated/locale_keys.g.dart';

class CustomerTab extends StatelessWidget {
  const CustomerTab({super.key, required this.cubit});
  final SignUpCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.customerFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.width * 0.03,
            right: context.width * 0.03,
            top: context.height * 0.03,
          ),
          child: Column(
            spacing: context.height * 0.01,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormFieldWithTitle(
                  hintText: LocaleKeys.signUp_hintTextNameCustomer.tr(),
                  title: LocaleKeys.signUp_titleNameCustomer.tr(),
                  controller: cubit.customerNameController),
              CustomTextFormFieldWithTitle(
                  hintText: LocaleKeys.signIn_hintTextEmailCustomer.tr(),
                  title: LocaleKeys.signIn_titleEmailCustomer.tr(),
                  controller: cubit.customerEmailController),
              CustomTextFormFieldWithTitle(
                  hintText: LocaleKeys.signUp_hintTextaddressCustomer.tr(),
                  title: LocaleKeys.signUp_titleAddressCustomer.tr(),
                  controller: cubit.customerAddressController),
              CustomTextFormFieldWithTitle(
                hintText: LocaleKeys.signIn_hintTextPasswordCustomer.tr(),
                title: LocaleKeys.signIn_titlePasswordCustomer.tr(),
                controller: cubit.customerPasswordController,
                isPassword: true,
              ),
              SizedBox(
                height: context.height * 0.007,
              ),
              BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return state is SignUpLoading
                      ? CustomLoading()
                      : CustomElevatedButton(
                          name: LocaleKeys.signIn_signUp.tr(),
                          onPressed: () {
                            cubit.signUp(
                              role: "Customer",
                              address: cubit.customerAddressController.text,
                              email: cubit.customerEmailController.text,
                              name: cubit.customerNameController.text,
                              password: cubit.customerPasswordController.text,
                            );
                          },
                          height: context.height * 0.07,
                          width: context.width * 0.8,
                        );
                },
              ),
              HaveAccountOrNot(
                title: LocaleKeys.signUp_HaveAccount.tr(),
                btnText: LocaleKeys.signIn_signIn.tr(),
                onPressed: () {
                  context.popScreen();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
