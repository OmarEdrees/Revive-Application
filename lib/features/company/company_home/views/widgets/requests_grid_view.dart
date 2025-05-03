import 'package:flutter/material.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/features/company/company_home/models/request_model.dart';
import 'package:revive/features/company/company_home/views/widgets/request_card.dart';

class RequestGridView extends StatelessWidget {
  const RequestGridView({
    super.key,
    required this.requests,
    required this.isNewItem,
  });
  final List<RequestModel> requests;
  final bool isNewItem;

  @override
  Widget build(BuildContext context) {
    return requests.isEmpty
        ? Center(
            child: Text(
              "No Requests Found",
              style: AppTextStyles.title24PrimaryColorW500,
            ),
          )
        : GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.03,
              vertical: context.height * 0.01,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: context.width * 0.03,
              mainAxisSpacing: context.height * 0.007,
            ),
            itemCount: requests.length,
            itemBuilder: (context, index) {
              return RequestCard(
                requestModel: requests[index],
                isNewItem: isNewItem,
              );
            },
          );
  }
}
