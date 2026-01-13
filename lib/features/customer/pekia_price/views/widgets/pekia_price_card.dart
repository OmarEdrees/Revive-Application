import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/generated/locale_keys.g.dart';

class PekiaPriceCard extends StatelessWidget {
  const PekiaPriceCard({
    super.key,
    required this.title,
    required this.prise,
  });
  final String title;
  final String prise;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: context.width * 0.05,
        right: context.width * 0.05,
        bottom: context.height * 0.01,
      ),
      padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.secondryColor.withOpacity(0.2),
        border: Border.all(color: AppColors.secondryColor, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Text(
                LocaleKeys.pekiaPrice_Kg.tr(),
                style: AppTextStyles.title20Black500,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: AppTextStyles.title20Black500,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "+ $prise\$",
                style: AppTextStyles.title20PrimaryColorW500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
