import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/company/redeem/view_models/cubit/redeem_cubit.dart';
import 'package:revive/features/company/redeem/views/widgets/add_redeem_form.dart';

class AddRedeemFloatActionButton extends StatelessWidget {
  const AddRedeemFloatActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (bottomSheetContext) {
                return BlocProvider.value(
                  value: context.read<RedeemCubit>(),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: context.width * 0.05,
                        right: context.width * 0.05,
                        top: context.height * 0.02,
                        bottom: MediaQuery.of(bottomSheetContext)
                                .viewInsets
                                .bottom +
                            context.height * 0.02,
                      ),
                      child: AddRedeemForm(),
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        );
      },
    );
  }
}
