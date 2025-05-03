import 'package:flutter/material.dart';
import 'package:revive/core/constants/app_constants.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/customer/categories/views/widgets/triple_bottom_wave_painter.dart';
import 'package:revive/features/customer/pekia_price/views/widgets/pekia_price_card.dart';
import 'package:revive/features/customer/pekia_price/views/widgets/pekia_price_tab_info.dart';

class PekiaPriceScreenBody extends StatelessWidget {
  const PekiaPriceScreenBody({
    super.key,
  });

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
        PekiaPriceTabInfo(),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(
              top: context.height * 0.03,
            ),
            itemCount: AppConstants.categoryProducts.length,
            itemBuilder: (context, index) {
              return PekiaPriceCard(
                prise: AppConstants.categoryProducts[index].price.toString(),
                title: AppConstants.categoryProducts[index].name,
              );
            },
          ),
        )
      ],
    );
  }
}

