import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    this.style,
  });
  final String title;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.05,
        vertical: context.height * 0.005,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Text(
        title,
        style: style ?? AppTextStyles.title28WhiteColorW500,
      ),
    );
  }
}
