import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/customer/pekia_price/views/widgets/custom_pekia_price_title.dart';
import 'package:revive/features/customer/pekia_price/views/widgets/custom_pekia_price_vertical_divider.dart';

class PekiaPriceTabInfo extends StatelessWidget {
  const PekiaPriceTabInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(
        right: context.width * 0.05,
        left: context.width * 0.05,
        top: context.height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: [
          CustomPekiaPriceTitle(
            title: "Weight",
          ),
          CustomPekiaPriceVerticalDivider(),
          CustomPekiaPriceTitle(
            color: AppColors.primaryColor,
            title: "Material",
          ),
          CustomPekiaPriceVerticalDivider(),
          CustomPekiaPriceTitle(
            title: "Price",
          ),
        ],
      ),
    );
  }
}
