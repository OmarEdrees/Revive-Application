import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class CustomPageViewBuilder extends StatelessWidget {
  const CustomPageViewBuilder({
    super.key,
    required this.controller,
    required this.lottieList,
    required this.titleList,
    required this.descriptionList,
    this.onPageChanged,
  });
  final PageController controller;
  final List<String> lottieList;
  final List<String> titleList;
  final List<String> descriptionList;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: controller,
        itemCount: lottieList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Lottie.asset(lottieList[index],
                  height: context.height * 0.4, fit: BoxFit.fill),
              SizedBox(height: context.height * 0.09),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.1,
                ),
                child: Column(
                  children: [
                    Text(
                      titleList[index],
                      style: AppTextStyles.title28WhiteW500,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.height * 0.01),
                    Text(
                      descriptionList[index],
                      style: AppTextStyles.title18White,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
