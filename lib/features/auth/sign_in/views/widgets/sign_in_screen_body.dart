import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/helper/show_custom_dialog.dart';
import 'package:revive/core/utilies/assets/images/app_images.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/auth/sign_in/view_models/cubit/sign_in_cubit.dart';
import 'package:revive/features/auth/sign_in/views/widgets/company_tap.dart';
import 'package:revive/features/auth/sign_in/views/widgets/customer_tab.dart';
import 'package:revive/features/auth/sign_in/views/widgets/sign_in_tab_bar.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              SignInTabBar(),
              BlocProvider(
                create: (context) => SignInCubit(),
                child: BlocConsumer<SignInCubit, SignInState>(
                  listener: (context, state) {
                    if (state is SignInSuccess) {
                      context.pushAndRemoveUntilScreen(state.route);
                      showCustomDialog(
                        title: "Success",
                        description: "Sign in successfully",
                        dialogType: DialogType.success,
                      );
                    }
                    if (state is SelectDiffrentRole) {
                      showCustomDialog(
                        title: "Failure",
                        description: "you are not a ${state.role}",
                        dialogType: DialogType.error,
                      );
                    }
                    if (state is SignInFailure) {
                      showCustomDialog(
                        title: "Failure",
                        description: state.error,
                        dialogType: DialogType.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    var cubit = context.read<SignInCubit>();
                    return Expanded(
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
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
