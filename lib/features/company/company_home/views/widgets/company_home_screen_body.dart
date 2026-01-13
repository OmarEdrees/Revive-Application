import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:revive/core/app_route/route_names.dart';
import 'package:revive/core/components/custom_icon_button.dart';
import 'package:revive/core/helper/show_custom_dialog.dart';
import 'package:revive/core/helper/show_snack_bar.dart';
import 'package:revive/core/utilies/assets/lotties/app_lotties.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/features/company/company_home/view_models/cubit/get_recycle_request_cubit.dart';
import 'package:revive/features/company/company_home/views/widgets/company_home_screen_tab_bar.dart';
import 'package:revive/features/company/company_home/views/widgets/company_home_screen_title.dart';
import 'package:revive/features/company/company_home/views/widgets/requests_grid_view.dart';
import 'package:revive/features/customer/categories/view_models/cubit/sign_out_cubit.dart';
import 'package:revive/features/customer/categories/views/widgets/triple_bottom_wave_painter.dart';
import 'package:revive/generated/locale_keys.g.dart';

class CompanyHomeScreenBody extends StatelessWidget {
  const CompanyHomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
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
                    );
                  },
                ),
              ),
            ),
          ),
          CompanyHomeScreenTitle(),
          CompanyHomeScreenTabBar(),
          Expanded(
            child: BlocConsumer<GetRecycleRequestCubit, GetRecycleRequestState>(
              listener: (context, state) {
                if (state is UpdateRequestSuccess) {
                  showSnackBar(
                      title: LocaleKeys.companyHome_SuccessSnackBar.tr());
                }
                if (state is UpdateRequestFailure) {
                  showSnackBar(title: LocaleKeys.companyHome_SuccessError.tr());
                }
              },
              builder: (context, state) {
                if (state is GetRecycleRequestLoading) {
                  return Center(
                    child: Lottie.asset(AppLotties.recyclableProducts),
                  );
                }
                if (state is UpdateRequestSuccess) {
                  context.popScreen();
                  return Center(
                    child: Lottie.asset(AppLotties.recyclableProducts),
                  );
                }
                if (state is GetRecycleRequestFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppTextStyles.title24PrimaryColorW500,
                    ),
                  );
                }
                return TabBarView(
                  children: [
                    RequestGridView(
                      requests:
                          context.read<GetRecycleRequestCubit>().newRequests,
                      isNewItem: true,
                    ),
                    RequestGridView(
                      requests: context
                          .read<GetRecycleRequestCubit>()
                          .completeRequests,
                      isNewItem: false,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
