import 'package:flutter/material.dart';
import 'package:revive/app/my_app.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

showSnackBar({required String title}) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: AppTextStyles.title18White,
      ),
      backgroundColor: AppColors.secondryColor,
    ),
  );
}