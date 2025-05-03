import 'package:flutter/widgets.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class CompanyHomeScreenTitle extends StatelessWidget {
  const CompanyHomeScreenTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: context.height * 0.01,
        bottom: context.height * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.07,
        vertical: context.width * 0.02,
      ),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          )),
      child: Text(
        "Recycle Requests",
        style: AppTextStyles.title24WhiteW500,
      ),
    );
  }
}
