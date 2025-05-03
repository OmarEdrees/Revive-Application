import 'package:flutter/material.dart';
import 'package:revive/core/components/custom_elevated_button.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: CustomElevatedButton(
        name: "Next",
        onPressed: onPressed,
        backgroundColor: Colors.white,
        textStyle: AppTextStyles.title18PrimaryColorW500,
      ),
    );
  }
}
