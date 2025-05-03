import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:revive/features/customer/categories/models/category_model.dart';
import 'package:revive/features/customer/category_details/views/widgets/category_details_screen_body.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    log(args.toString());
    final categoryModel = CategoryModel.fromJson(args);
    return Scaffold(
      body: CategoryDetailsScreenBody(
        categoryModel: categoryModel,
      ),
    );
  }
}



