import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:revive/core/components/custom_icon_button.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/features/company/redeem/models/redeem_model.dart';
import 'package:revive/generated/locale_keys.g.dart';

class RedeemListTile extends StatelessWidget {
  const RedeemListTile({
    super.key,
    required this.redeemModel,
    this.onPressed,
    this.iconData,
  });

  final RedeemModel redeemModel;
  final Function()? onPressed;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      title: Text(
        '${LocaleKeys.Redeem_Title.tr()} : ${redeemModel.name} \n${LocaleKeys.Redeem_Price.tr()} : ${redeemModel.price} \$',
        style: AppTextStyles.title20PrimaryColorW500,
      ),
      subtitle: Text(
        '${LocaleKeys.Redeem_Description.tr()} : ${redeemModel.description}',
        style: AppTextStyles.title16GreyW500,
      ),
      trailing: onPressed == null
          ? null
          : CustomIconButton(
              icon: iconData ?? Icons.delete_forever,
              color: AppColors.primaryColor,
              onPressed: onPressed,
            ),
    );
  }
}
