import 'package:flutter/material.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndecator extends StatelessWidget {
  const CustomSmoothPageIndecator({
    super.key,
    required this.controller,
    required this.count,
  });

  final PageController controller;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: context.height * 1.6,
      left: 0,
      right: 0,
      child: Center(
        child: SmoothPageIndicator(
          controller: controller,
          count: count,
          effect: SwapEffect(
            dotWidth: context.width * 0.1,
            activeDotColor: Colors.white,
            dotColor: Colors.grey.shade400,
            strokeWidth: BorderSide.strokeAlignOutside,
          ),
        ),
      ),
    );
  }
}
