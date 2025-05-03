import 'package:flutter/material.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class QuantityAndProductName extends StatelessWidget {
  const QuantityAndProductName({
    super.key,
    required this.quantity,
    required this.productName,
  });

  final String quantity, productName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$quantity Kg ",
          style: AppTextStyles.title18Black,
        ),
        Text(
          productName,
          style: AppTextStyles.title20PrimaryColorW500,
        ),
      ],
    );
  }
}
