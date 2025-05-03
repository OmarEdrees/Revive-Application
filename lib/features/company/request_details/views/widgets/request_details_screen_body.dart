import 'package:flutter/material.dart';
import 'package:revive/core/helper/get_image_name.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/company/company_home/models/request_model.dart';
import 'package:revive/features/company/request_details/views/widgets/request_details_list_tile.dart';

class RequestDetailsScreenBody extends StatelessWidget {
  const RequestDetailsScreenBody({
    super.key,
    required this.request,
  });

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                height: context.height * 0.3,
                fit: BoxFit.cover,
                getImageName(categoryName: request.categoryName),
              ),
            ),
          ),
          RequestDetailsListTile(
            title: "Category Name",
            value: request.categoryName,
          ),
          RequestDetailsListTile(
            title: "Product Name",
            value: request.productName,
          ),
          RequestDetailsListTile(
            title: "Product Quantity",
            value: request.productQuantity.toString(),
          ),
          RequestDetailsListTile(
            title: "Product Price",
            value: request.productPrice.toString(),
          ),
          RequestDetailsListTile(
            title: "User Name",
            value: request.userName,
          ),
        ],
      ),
    );
  }
}

