import 'package:flutter/material.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';

class CustomPekiaPriceVerticalDivider extends StatelessWidget {
  const CustomPekiaPriceVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width * 0.18,
      width: context.width * 0.005,
      child: VerticalDivider(
        color: Colors.amberAccent,
      ),
    );
  }
}

