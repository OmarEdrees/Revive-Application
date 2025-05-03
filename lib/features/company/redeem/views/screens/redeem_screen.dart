import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/features/company/redeem/view_models/cubit/redeem_cubit.dart';
import 'package:revive/features/company/redeem/views/widgets/add_redeem_float_action_button.dart';
import 'package:revive/features/company/redeem/views/widgets/redeem_screen_body.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RedeemCubit(),
      child: Scaffold(
        body: const RedeemScreenBody(),
        floatingActionButton: AddRedeemFloatActionButton(),
      ),
    );
  }
}






