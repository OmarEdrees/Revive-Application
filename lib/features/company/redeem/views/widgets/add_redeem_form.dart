import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/components/custom_elevated_button.dart';
import 'package:revive/core/components/custom_text_form_field_with_title.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/company/redeem/view_models/cubit/redeem_cubit.dart';

class AddRedeemForm extends StatelessWidget {
  const AddRedeemForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RedeemCubit>().formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormFieldWithTitle(
            hintText: "enter redeem title",
            title: "Redeem Title",
            controller: context.read<RedeemCubit>().redeemNameController,
          ),
          CustomTextFormFieldWithTitle(
            hintText: "enter redeem description",
            title: "Redeem Description",
            controller: context.read<RedeemCubit>().redeemDescriptionController,
          ),
          CustomTextFormFieldWithTitle(
            hintText: "enter redeem price",
            title: "Redeem Price",
            controller: context.read<RedeemCubit>().redeemPriceController,
          ),
          SizedBox(height: context.height * 0.05),
          CustomElevatedButton(
            name: "Add Redeem",
            height: context.height * 0.06,
            width: context.width * 0.8,
            onPressed: () {
              context.read<RedeemCubit>().addRedeem();
              context.popScreen();
            },
          ),
        ],
      ),
    );
  }
}
