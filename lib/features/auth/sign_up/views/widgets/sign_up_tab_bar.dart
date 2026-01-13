import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/generated/locale_keys.g.dart';

class SignUpTabBar extends StatelessWidget {
  const SignUpTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0,
      indicator: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      labelStyle: AppTextStyles.title20WhiteBold,
      unselectedLabelStyle: AppTextStyles.title18PrimaryColorW500,
      padding: EdgeInsets.all(0),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          child: Text(
            LocaleKeys.signIn_Customer.tr(),
          ),
        ),
        Tab(
          child: Text(
            LocaleKeys.signIn_Company.tr(),
          ),
        ),
      ],
    );
  }
}
