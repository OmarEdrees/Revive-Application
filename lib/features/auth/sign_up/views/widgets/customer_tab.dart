import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/components/custom_elevated_button.dart';
import 'package:revive/core/components/custom_text_form_field_with_title.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/auth/sign_in/views/widgets/custom_loading.dart';
import 'package:revive/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:revive/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';

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
                  hintText: "enter customer name",
                  title: "Customer Name",
                  controller: cubit.customerNameController),
              CustomTextFormFieldWithTitle(
                  hintText: "enter customer email",
                  title: "Customer Email",
                  controller: cubit.customerEmailController),
              CustomTextFormFieldWithTitle(
                  hintText: "enter customer address",
                  title: "Customer Address",
                  controller: cubit.customerAddressController),
              CustomTextFormFieldWithTitle(
                hintText: "enter customer password",
                title: "Customer Password",
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
                          name: "Sign Up",
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
    );
  }
}
