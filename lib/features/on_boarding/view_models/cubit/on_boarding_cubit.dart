import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/utilies/assets/lotties/app_lotties.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:revive/generated/locale_keys.g.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);
  final PageController controller = PageController();

  List<String> lottieList = [
    AppLotties.welcomeLottie,
    AppLotties.recyclableProducts,
    AppLotties.selectIndustry,
    AppLotties.earnPoint,
    AppLotties.getStarted,
  ];

  List<String> titleList = [
    LocaleKeys.onboarding_welcome_title.tr(),
    LocaleKeys.onboarding_donate_title.tr(),
    LocaleKeys.onboarding_select_title.tr(),
    LocaleKeys.onboarding_earn_title.tr(),
    LocaleKeys.onboarding_get_title.tr(),
  ];

  List<String> descriptionList = [
    LocaleKeys.onboarding_welcome_description.tr(),
    LocaleKeys.onboarding_donate_description.tr(),
    LocaleKeys.onboarding_select_description.tr(),
    LocaleKeys.onboarding_earn_description.tr(),
    LocaleKeys.onboarding_get_description.tr(),
  ];

  void nextPage() {
    if (state < lottieList.length - 1) {
      controller.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      emit(state + 1);
    }
  }

  void backPage() {
    if (state > 0) {
      controller.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      emit(state - 1);
    }
  }

  void onPageChanged(int index) {
    emit(index);
  }
}
