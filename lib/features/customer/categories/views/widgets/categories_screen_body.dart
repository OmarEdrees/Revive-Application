import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:revive/features/customer/profile/views/widgets/profile_screen_body.dart';
import 'package:revive/generated/locale_keys.g.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.locale.languageCode == 'en';
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
                      title: LocaleKeys.categoryProducts_dialog_Success.tr(),
                      description: LocaleKeys
                          .categoryProducts_dialog_successMessage
                          .tr(),
                      dialogType: DialogType.success,
                    );
                  }
                  if (state is SignOutFailed) {
                    showCustomDialog(
                      title: LocaleKeys.categoryProducts_dialog_Failed.tr(),
                      description: state.message,
                      dialogType: DialogType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return Row(
                    children: [
                      Align(
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
                                    title: LocaleKeys
                                        .categoryProducts_dialog_SignOut
                                        .tr(),
                                    description: LocaleKeys
                                        .categoryProducts_dialog_SignOutMessage
                                        .tr(),
                                    dialogType: DialogType.question,
                                    btnOkOnPress:
                                        context.read<SignOutCubit>().signOut,
                                  );
                                },
                              ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.onboarding_buttons_changeLang.tr(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Switch(
                              activeColor: Colors.black,
                              value: isEnglish,
                              onChanged: (value) {
                                if (value) {
                                  context.setLocale(const Locale('en'));
                                } else {
                                  context.setLocale(const Locale('ar'));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        CustomTitle(
          title: LocaleKeys.categoryProducts_dialog_title.tr(),
        ),
        SizedBox(
          height: context.height * 0.015,
        ),
        PekiaGridView()
      ],
    );
  }
}
