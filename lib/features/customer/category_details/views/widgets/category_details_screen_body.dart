import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/components/custom_elevated_button.dart';
import 'package:revive/core/components/custom_icon_button.dart';
import 'package:revive/core/helper/show_custom_dialog.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/customer/categories/models/category_model.dart';
import 'package:revive/features/customer/categories/views/widgets/triple_bottom_wave_painter.dart';
import 'package:revive/features/customer/category_details/view_models/cubit/category_details_cubit.dart';
import 'package:revive/features/customer/category_details/views/widgets/category_details_grid_view.dart';
import 'package:revive/features/customer/category_details/views/widgets/select_category_quantity_and_price.dart';

class CategoryDetailsScreenBody extends StatelessWidget {
  const CategoryDetailsScreenBody({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryDetailsCubit(),
      child: BlocConsumer<CategoryDetailsCubit, CategoryDetailsState>(
        listener: (context, state) {
          if (state is AddRequestSuccess) {
            context.popScreen();
            showCustomDialog(
                title: "Success",
                description: "Request sent successfully",
                dialogType: DialogType.success);
          }
          if (state is FillAllRequestField) {
            showCustomDialog(
                title: "Hint",
                description: "Please Fill All Fields",
                dialogType: DialogType.success);
          }
          if (state is AddRequestFailed) {
            showCustomDialog(
                title: "Failed",
                description: state.errorMessage,
                dialogType: DialogType.error);
          }
        },
        builder: (context, state) {
          var cubit = context.read<CategoryDetailsCubit>();
          return Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: context.height * 0.2,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: TripleBottomWavePainter(),
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.015,
                  ),
                  SelectCategoryQuantityAndPrice(
                      cubit: cubit, categoryModel: categoryModel),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.05,
                      vertical: context.height * 0.015,
                    ),
                    child: Divider(
                      color: AppColors.primaryColor,
                      thickness: 2,
                    ),
                  ),
                  CategoryDetailsGridView(
                    categoryProfuctsModel: categoryModel.products,
                  ),
                  SizedBox(
                    height: context.height * 0.1,
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.05,
                    vertical: context.height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    spacing: context.width * 0.05,
                    children: [
                      CustomIconButton(
                          icon: Icons.arrow_back,
                          onPressed: () {
                            context.popScreen();
                          }),
                      state is AddRequestLoading
                          ? Center(
                              child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ))
                          : CustomElevatedButton(
                              name: "Add Request",
                              width: context.width * 0.75,
                              height: context.height * 0.07,
                              onPressed: () {
                                context
                                    .read<CategoryDetailsCubit>()
                                    .categoryName = categoryModel.name;
                                context
                                    .read<CategoryDetailsCubit>()
                                    .addRequest();
                              },
                            )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
