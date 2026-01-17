import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/components/custom_drop_down_button_form_field.dart';
import 'package:revive/core/components/custom_elevated_button.dart';
import 'package:revive/core/components/custom_text_form_field_with_title.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/features/auth/sign_in/views/widgets/custom_loading.dart';
import 'package:revive/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:revive/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';
import 'package:revive/generated/locale_keys.g.dart';

class CompanyTab extends StatelessWidget {
  const CompanyTab({super.key, required this.cubit});
  final SignUpCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.companyFormKey,
      child: Center(
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
                  hintText: LocaleKeys.signUp_hintTextNameCompany.tr(),
                  title: LocaleKeys.signUp_titleNameCompany.tr(),
                  controller: cubit.companyNameController,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: LocaleKeys.signUp_hintTextAddressCompany.tr(),
                  title: LocaleKeys.signUp_titleAddressCompany.tr(),
                  controller: cubit.companyAddressController,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: LocaleKeys.signIn_hintTextEmailCompany.tr(),
                  title: LocaleKeys.signIn_titleEmailCompany.tr(),
                  controller: cubit.companyEmailController,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.signUp_CompanyIndustry.tr(),
                      style: AppTextStyles.title18PrimaryColorW500,
                    ),
                    SizedBox(height: context.height * 0.003),
                    CustomDropDownButtonFormField(
                      hintText: LocaleKeys.signUp_SelectIndustry.tr(),
                      userRoles: [
                        LocaleKeys.categoryProducts_Plastic_title.tr(),
                        LocaleKeys.categoryProducts_Metal_title.tr(),
                        LocaleKeys.categoryProducts_EWaste_title.tr(),
                        LocaleKeys.categoryProducts_Cardboard_title.tr(),
                        LocaleKeys.categoryProducts_Paper_title.tr(),
                        LocaleKeys.categoryProducts_Glass_title.tr(),
                      ],
                      controller: cubit.companyIndustryController,
                    ),
                  ],
                ),
                CustomTextFormFieldWithTitle(
                  hintText: LocaleKeys.signIn_hintTextPasswordCompany.tr(),
                  title: LocaleKeys.signIn_titlePasswordCompany.tr(),
                  controller: cubit.companyPasswordController,
                  isPassword: true,
                ),
                SizedBox(
                  height: context.height * 0.007,
                ),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return state is SignUpLoading
                        ? const CustomLoading()
                        : CustomElevatedButton(
                            name: LocaleKeys.signIn_signUp.tr(),
                            onPressed: () {
                              cubit.signUp(
                                role: "Company",
                                address: cubit.companyAddressController.text,
                                email: cubit.companyEmailController.text.trim(),
                                name: cubit.companyNameController.text,
                                password: cubit.companyPasswordController.text,
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
      ),
    );
  }
}
