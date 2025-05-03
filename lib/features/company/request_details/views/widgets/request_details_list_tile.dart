import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class RequestDetailsListTile extends StatelessWidget {
  const RequestDetailsListTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColor.withOpacity(0.5),
      child: ListTile(
        title: Text(
          "$title: ",
          style: AppTextStyles.title18White,
        ),
        trailing: Text(
          value,
          style: AppTextStyles.title18Black,
        ),
      ),
    );
  }
}
