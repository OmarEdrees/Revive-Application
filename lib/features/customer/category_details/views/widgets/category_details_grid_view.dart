import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/customer/category_details/models/category_products_model.dart';
import 'package:revive/features/customer/category_details/view_models/cubit/category_details_cubit.dart';
import 'package:revive/features/customer/category_details/views/widgets/custom_product_card.dart';

class CategoryDetailsGridView extends StatelessWidget {
  const CategoryDetailsGridView({
    super.key,
    required this.categoryProfuctsModel,
  });
  final List<CategoryProductsModel> categoryProfuctsModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: categoryProfuctsModel.length,
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02,
          vertical: context.height * 0.008,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          crossAxisSpacing: context.width * 0.02,
          mainAxisSpacing: context.height * 0.01,
        ),
        itemBuilder: (context, index) {
          return BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
            buildWhen: (previous, current) {
              if (current is ChangeSelectedProduct) {
                return current.index == index ||
                    context.read<CategoryDetailsCubit>().selectedIndex == index;
              }
              return false;
            },
            builder: (context, state) {
              final selectedIndex =
                  context.read<CategoryDetailsCubit>().selectedIndex;
              return GestureDetector(
                onTap: () {
                  context
                      .read<CategoryDetailsCubit>()
                      .changeSelectedIndex(index);
                  context.read<CategoryDetailsCubit>().productName =
                      categoryProfuctsModel[index].name;
                },
                child: CustomProductCard(
                  isSelected: selectedIndex == index,
                  categoryProductsModel: categoryProfuctsModel[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
