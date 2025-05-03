import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/utilies/assets/lotties/app_lotties.dart';

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
    "Welcome to Revive!",
    "Donate Recyclable Products!",
    "Select Your Industry!",
    "Earn Rewards for Recycling!",
    "Get Started with Revive!",
  ];

  List<String> descriptionList = [
    "Join us in our mission to make the world a cleaner place by recycling and earning rewards.",
    "Drop off your recyclable items and earn points that can be exchanged for vouchers.",
    "As a company, choose the recycling industry you want to support, and start collecting donations.",
    "For every item you recycle, you get points that can be exchanged for exciting vouchers!",
    "Sign up or log in to begin your journey with Revive and start making a difference.",
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
