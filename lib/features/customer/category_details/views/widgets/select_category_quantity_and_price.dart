import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/features/customer/categories/models/category_model.dart';
import 'package:revive/features/customer/category_details/view_models/cubit/category_details_cubit.dart';
import 'package:revive/generated/locale_keys.g.dart';

class SelectCategoryQuantityAndPrice extends StatelessWidget {
  const SelectCategoryQuantityAndPrice({
    super.key,
    required this.cubit,
    required this.categoryModel,
  });

  final CategoryDetailsCubit cubit;
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
      buildWhen: (previous, current) {
        if (current is ChangeCategoryDetailsSlider &&
            previous is ChangeCategoryDetailsSlider) {
          return current.value != previous.value;
        }
        return false;
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.07,
            vertical: context.height * 0.007,
          ),
          width: context.width * 0.95,
          height: context.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.secondryColor.withOpacity(0.5),
            border: Border.all(color: AppColors.primaryColor, width: 5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "${cubit.sliderValue.toStringAsFixed(2)} Kg",
                        style: AppTextStyles.title28WhiteW500,
                      ),
                      Text(categoryModel.name.tr(),
                          style: AppTextStyles.title20WhiteW500),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "+   ${(cubit.sliderValue * categoryModel.price).toStringAsFixed(2)} \$",
                        style: AppTextStyles.title28PrimaryColorW500,
                      ),
                      Text(LocaleKeys.categoryDetails_income.tr(),
                          style: AppTextStyles.title20WhiteW500),
                    ],
                  ),
                ],
              ),
              Slider(
                min: 0.25,
                max: 20,
                divisions: ((20 - 0.25) / 0.25).round(),
                activeColor: AppColors.primaryColor,
                value: state is ChangeCategoryDetailsSlider
                    ? state.value
                    : cubit.sliderValue,
                onChanged: (value) {
                  cubit.changeSliderValue(value);
                  context.read<CategoryDetailsCubit>().productPrice =
                      (cubit.sliderValue * categoryModel.price)
                          .toStringAsFixed(2);
                  context.read<CategoryDetailsCubit>().productQuantity =
                      (cubit.sliderValue).toStringAsFixed(2);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
