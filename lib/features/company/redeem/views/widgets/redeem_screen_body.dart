import 'package:flutter/material.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/company/redeem/views/widgets/redeem_items_title.dart';
import 'package:revive/features/company/redeem/views/widgets/redeems_list_view.dart';
import 'package:revive/features/customer/categories/views/widgets/triple_bottom_wave_painter.dart';

class RedeemScreenBody extends StatelessWidget {
  const RedeemScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.2,
          width: double.infinity,
          child: CustomPaint(
            painter: TripleBottomWavePainter(),
          ),
        ),
        RedeemItemsTitle(),
        RedeemsListView(),
      ],
    );
  }
}
