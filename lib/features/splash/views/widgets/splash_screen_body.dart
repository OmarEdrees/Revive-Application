import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:revive/core/utilies/assets/images/app_images.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(AppImages.logo)
            .animate()
            .slideY(begin: -1, end: 0, duration: 900.ms),
        Text(
          "Revive",
          style: AppTextStyles.title36PrimaryColorW500,
        )
            .animate(
              delay: 1000.ms,
            )
            .rotate(begin: -1, end: 0, duration: 1200.ms)
            .fadeIn(),
      ],
    );
  }
}
