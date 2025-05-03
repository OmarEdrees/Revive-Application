import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/features/company/redeem/view_models/cubit/redeem_cubit.dart';
import 'package:revive/features/company/redeem/views/widgets/redeem_list_tile.dart';

class RedeemsListView extends StatelessWidget {
  const RedeemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<RedeemCubit, RedeemState>(
        builder: (context, state) {
          if (state is RedeemLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (state is RedeemFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.title28PrimaryColorW500,
              ),
            );
          }
          final redeemCubit = context.read<RedeemCubit>();
          return ListView.builder(
            itemCount: redeemCubit.redeemList.length,
            padding: EdgeInsets.only(
              top: context.height * 0.02,
              left: context.width * 0.03,
              right: context.width * 0.03,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: context.height * 0.01,
                ),
                child: RedeemListTile(
                  redeemModel: redeemCubit.redeemList[index],
                  onPressed: () {
                    redeemCubit.deleteRedeem(
                      id: redeemCubit.redeemList[index].id,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
