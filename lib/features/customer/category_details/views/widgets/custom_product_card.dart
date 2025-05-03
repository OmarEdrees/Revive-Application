import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/features/customer/category_details/models/category_products_model.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    required this.isSelected,
    required this.categoryProductsModel,
  });

  final bool isSelected;
  final CategoryProductsModel categoryProductsModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.secondryColor, width: 3),
      ),
      color: isSelected ? AppColors.primaryColor.withOpacity(0.3) : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryProductsModel.image,
            width: context.width * 0.3,
            height: context.width * 0.2,
          ),
          Text(
            categoryProductsModel.name,
            style: isSelected
                ? AppTextStyles.title20WhiteW500
                : AppTextStyles.title20PrimaryColorW500,
          )
        ],
      ),
    );
  }
}
