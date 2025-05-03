import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class CustomPekiaPriceTitle extends StatelessWidget {
  const CustomPekiaPriceTitle({
    super.key,
    required this.title,
    this.color,
  });
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: context.width * 0.18,
        decoration: BoxDecoration(
          color: color?.withOpacity(0.7) ??
              AppColors.secondryColor.withOpacity(0.8),
        ),
        padding: EdgeInsets.symmetric(
          vertical: context.height * 0.03,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.title20WhiteBold,
          ),
        ),
      ),
    );
  }
}
