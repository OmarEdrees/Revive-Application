import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class RedeemItemsTitle extends StatelessWidget {
  const RedeemItemsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.01,
        horizontal: context.width * 0.03,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Text(
        'Redeem Items',
        style: AppTextStyles.title28WhiteColorW500,
      ),
    );
  }
}
