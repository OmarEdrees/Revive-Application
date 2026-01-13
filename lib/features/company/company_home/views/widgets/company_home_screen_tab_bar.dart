import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/generated/locale_keys.g.dart' show LocaleKeys;

class CompanyHomeScreenTabBar extends StatelessWidget {
  const CompanyHomeScreenTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.007,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyles.title20WhiteW500,
      unselectedLabelStyle: AppTextStyles.title20Black500,
      indicatorPadding: EdgeInsets.symmetric(
        horizontal: context.width * 0.02,
        vertical: context.height * 0.007,
      ),
      dividerHeight: 0,
      tabs: [
        Tab(text: LocaleKeys.companyHome_New.tr()),
        Tab(text: LocaleKeys.companyHome_Completed.tr()),
      ],
    );
  }
}
