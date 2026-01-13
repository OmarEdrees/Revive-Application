import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:revive/core/components/custom_out_line_button.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/generated/locale_keys.g.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: CustomOutLineButton(
        name: LocaleKeys.onboarding_buttons_back.tr(),
        onPressed: onPressed,
        textStyle: AppTextStyles.title18White,
      ),
    );
  }
}
