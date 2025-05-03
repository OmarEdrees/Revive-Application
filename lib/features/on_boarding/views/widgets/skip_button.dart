import 'package:flutter/material.dart';
import 'package:revive/core/app_route/route_names.dart';
import 'package:revive/core/components/custom_elevated_button.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: CustomElevatedButton(
        name: "Skip",
        hPadding: context.width * 0.006,
        wPadding: context.height * 0.003,
        onPressed: () {
          context.pushReplacementScreen(RouteNames.signInScreen);
        },
      ),
    );
  }
}
