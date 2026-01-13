import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/helper/show_custom_dialog.dart';
import 'package:revive/core/utilies/assets/images/app_images.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/auth/sign_up/view_models/cubit/sign_up_cubit.dart';
import 'package:revive/features/auth/sign_up/views/widgets/company_tab.dart';
import 'package:revive/features/auth/sign_up/views/widgets/customer_tab.dart';
import 'package:revive/features/auth/sign_up/views/widgets/sign_up_tab_bar.dart';
import 'package:revive/generated/locale_keys.g.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            context.popScreen();
            showCustomDialog(
              title: LocaleKeys.signUp_dialog_Success.tr(),
              description: LocaleKeys.signUp_dialog_SuccessMessage.tr(),
              dialogType: DialogType.success,
            );
          }
          if (state is SelectIndustry) {
            showCustomDialog(
              title: LocaleKeys.signUp_dialog_Info.tr(),
              description: LocaleKeys.signUp_dialog_InfoMessage.tr(),
              dialogType: DialogType.info,
            );
          }
          if (state is SignUpFailure) {
            showCustomDialog(
              title: LocaleKeys.signUp_dialog_Failure.tr(),
              description: state.errorMessage,
              dialogType: DialogType.error,
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<SignUpCubit>();
          return SafeArea(
            child: DefaultTabController(
              length: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.05,
                  vertical: context.height * 0.007,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.logo,
                      width: context.width * 0.4,
                    ),
                    SignUpTabBar(),
                    Expanded(
                      child: TabBarView(
                        children: [
                          CustomerTab(
                            cubit: cubit,
                          ),
                          CompanyTab(
                            cubit: cubit,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
