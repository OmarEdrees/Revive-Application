import 'package:flutter/material.dart';
import 'package:revive/core/components/custom_text_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextButton(onPressed: () {}, title: "Forget password?"),
      ],
    );
  }
}
