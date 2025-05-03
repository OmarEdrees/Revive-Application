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
                  hintText: "enter company name",
                  title: "Company Name",
                  controller: cubit.companyNameController,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: "enter company email",
                  title: "Company Email",
                  controller: cubit.companyEmailController,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: "enter company address",
                  title: "Company Address",
                  controller: cubit.companyAddressController,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company Industry",
                      style: AppTextStyles.title18PrimaryColorW500,
                    ),
                    SizedBox(height: context.height * 0.003),
                    CustomDropDownButtonFormField(
                      hintText: 'Select Industry',
                      userRoles: [
                        "Plastic",
                        "Metal",
                        "E-Waste",
                        "Cardboard",
                        "Paper",
                        "Glass",
                      ],
                      controller: cubit.companyIndustryController,
                    ),
                  ],
                ),
                CustomTextFormFieldWithTitle(
                  hintText: "enter company password",
                  title: "Company Password",
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
                            name: "Sign Up",
                            onPressed: () {
                              cubit.signUp(
                                role: "Company",
                                address: cubit.companyAddressController.text,
                                email: cubit.companyEmailController.text,
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
                  title: 'Have an account',
                  btnText: "Sign In",
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
