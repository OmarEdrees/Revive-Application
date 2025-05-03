import 'package:flutter/material.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class CustomOutLineButton extends StatelessWidget {
  const CustomOutLineButton({
    super.key,
    required this.name,
    this.onPressed,
    this.textStyle,
    this.hPadding,
    this.wPadding,
    this.height,
    this.width,
    this.backgroundColor,
    this.forgroundColor,
  });

  final String name;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final double? hPadding, wPadding;
  final double? height, width;
  final Color? backgroundColor;
  final Color? forgroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: forgroundColor ?? Colors.white,
        backgroundColor: backgroundColor,
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.05,
          vertical: context.height * 0.01,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: textStyle ?? AppTextStyles.title20PrimaryColorW500,
      ),
    );
  }
}
