import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/app_route/route_names.dart';
import 'package:revive/core/components/custom_icon_button.dart';
import 'package:revive/core/helper/show_custom_dialog.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/customer/categories/view_models/cubit/sign_out_cubit.dart';
import 'package:revive/features/customer/categories/views/widgets/custom_title.dart';
import 'package:revive/features/customer/categories/views/widgets/pekia_grid_view.dart';
import 'package:revive/features/customer/categories/views/widgets/triple_bottom_wave_painter.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.2,
          width: double.infinity,
          child: CustomPaint(
            painter: TripleBottomWavePainter(),
            child: BlocProvider(
              create: (context) => SignOutCubit(),
              child: BlocConsumer<SignOutCubit, SignOutState>(
                listener: (context, state) {
                  if (state is SignOutSuccess) {
                    context.pushAndRemoveUntilScreen(RouteNames.signInScreen);
                    showCustomDialog(
                      title: "Success",
                      description: "Sign out successfully",
                      dialogType: DialogType.success,
                    );
                  }
                  if (state is SignOutFailed) {
                    showCustomDialog(
                      title: "Failed",
                      description: state.message,
                      dialogType: DialogType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: state is SignOutLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : CustomIconButton(
                            icon: Icons.logout_rounded,
                            color: Colors.white,
                            onPressed: () {
                              showCustomDialog(
                                title: "Sign out",
                                description:
                                    "Are you sure you want to sign out",
                                dialogType: DialogType.question,
                                btnOkOnPress:
                                    context.read<SignOutCubit>().signOut,
                              );
                            },
                          ),
                  );
                },
              ),
            ),
          ),
        ),
        CustomTitle(
          title: "Revive Categories",
        ),
        SizedBox(
          height: context.height * 0.015,
        ),
        PekiaGridView()
      ],
    );
  }
}
