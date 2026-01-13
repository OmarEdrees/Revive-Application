import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:revive/core/helper/get_image_name.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/company/company_home/models/request_model.dart';
import 'package:revive/features/company/request_details/views/widgets/request_details_list_tile.dart';
import 'package:revive/generated/locale_keys.g.dart';

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
            title: LocaleKeys.request_details_CategoryName.tr(),
            value: request.categoryName,
          ),
          RequestDetailsListTile(
            title: LocaleKeys.request_details_ProductName.tr(),
            value: request.productName,
          ),
          RequestDetailsListTile(
            title: LocaleKeys.request_details_ProductQuantity.tr(),
            value: request.productQuantity.toString(),
          ),
          RequestDetailsListTile(
            title: LocaleKeys.request_details_ProductPrice.tr(),
            value: request.productPrice.toString(),
          ),
          RequestDetailsListTile(
            title: LocaleKeys.request_details_UserName.tr(),
            value: request.userName,
          ),
        ],
      ),
    );
  }
}
