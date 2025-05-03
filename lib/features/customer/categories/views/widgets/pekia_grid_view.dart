import 'package:flutter/material.dart';
import 'package:revive/core/app_route/route_names.dart';
import 'package:revive/core/constants/app_constants.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';

class PekiaGridView extends StatelessWidget {
  const PekiaGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: AppConstants.categoryProducts.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.pushScreen(RouteNames.categoryDetailsScreen,
                arguments: AppConstants.categoryProducts[index].toJson());
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(context.height * 0.005),
              child: Image.asset(AppConstants.categoryProducts[index].image),
            ),
          ),
        ),
      ),
    );
  }
}
