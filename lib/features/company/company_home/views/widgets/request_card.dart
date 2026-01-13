import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/app_route/route_names.dart';
import 'package:revive/core/helper/get_image_name.dart';
import 'package:revive/core/helper/show_clipper_dialog.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/company/company_home/models/request_model.dart';
import 'package:revive/features/company/company_home/view_models/cubit/get_recycle_request_cubit.dart';
import 'package:revive/features/company/company_home/views/widgets/quantity_and_product_name.dart';
import 'package:revive/generated/locale_keys.g.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
    required this.requestModel,
    required this.isNewItem,
  });
  final bool isNewItem;

  final RequestModel requestModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushScreen(RouteNames.requestDetailsScreen,
            arguments: requestModel.toJson());
      },
      onLongPress: isNewItem
          ? () {
              showCustomClipperDialog(
                  title: LocaleKeys.categoryDetails_Hint.tr(),
                  message: LocaleKeys.companyHome_message.tr(),
                  onConfirm: () {
                    context
                        .read<GetRecycleRequestCubit>()
                        .completeRequest(requestModel.id);
                  });
            }
          : () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02,
          vertical: context.height * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.secondryColor, width: 2.5),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                getImageName(categoryName: requestModel.categoryName),
              ),
            ),
            SizedBox(
              height: context.height * 0.007,
            ),
            QuantityAndProductName(
              productName: requestModel.productName,
              quantity: requestModel.productQuantity.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
