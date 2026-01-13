import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:revive/core/components/custom_text_button.dart';
import 'package:revive/generated/locale_keys.g.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(
            onPressed: () {}, title: LocaleKeys.signIn_Forgetpassword.tr()),
      ],
    );
  }
}
