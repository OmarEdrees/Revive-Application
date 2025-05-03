import 'package:flutter/material.dart';
import 'package:revive/core/components/custom_text_button.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({
    super.key,
    required this.title,
    required this.btnText,
    this.onPressed,
  });
  final String title, btnText;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.title18Black,
        ),
        CustomTextButton(
          onPressed: onPressed,
          title: btnText,
        )
      ],
    );
  }
}
