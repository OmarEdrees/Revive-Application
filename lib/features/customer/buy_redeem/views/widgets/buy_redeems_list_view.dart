import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/helper/show_custom_dialog.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';
import 'package:revive/features/company/redeem/views/widgets/redeem_list_tile.dart';
import 'package:revive/features/customer/buy_redeem/view_models/cubit/buy_redeem_cubit.dart';
import 'package:revive/generated/locale_keys.g.dart';

class RedeemsListView extends StatelessWidget {
  const RedeemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<BuyRedeemCubit, BuyRedeemState>(
        listener: (context, state) {
          if (state is NotEnoughPoints) {
            showCustomDialog(
                title: LocaleKeys.Redeem_dialog_Hint.tr(),
                description: state.errorMessage,
                dialogType: DialogType.noHeader);
          }
          if (state is EnoughPoints) {
            showCustomDialog(
                title: LocaleKeys.Redeem_dialog_Success.tr(),
                description: LocaleKeys.Redeem_dialog_successMessage.tr(),
                dialogType: DialogType.success);
          }
        },
        builder: (context, state) {
          if (state is BuyRedeemLoading || state is CheckPoints) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (state is BuyRedeemFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyles.title24PrimaryColorW500,
                textAlign: TextAlign.center,
              ),
            );
          }
          final redeemCubit = context.read<BuyRedeemCubit>();
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
                child: state is CheckPoints
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : RedeemListTile(
                        redeemModel: redeemCubit.redeemList[index],
                        iconData: Icons.shopify_outlined,
                        onPressed: () {
                          redeemCubit.buyRedeem(
                            redeemPrice: redeemCubit.redeemList[index].price,
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
