import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:revive/features/customer/categories/view_models/cubit/bottom_navigation_bar_cubit.dart';
import 'package:revive/features/customer/categories/views/widgets/custom_bottom_navigation_bar_icon.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarCubit(),
      child: BlocBuilder<BottomNavigationBarCubit, int>(
        builder: (context, state) {
          var cubit = context.read<BottomNavigationBarCubit>();
          return Scaffold(
            body: cubit.screens[cubit.index],
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: AppColors.primaryColor.withOpacity(0.5),
              color: AppColors.secondryColor,
              buttonBackgroundColor: AppColors.primaryColor,
              height: context.height * 0.08,
              index: cubit.index,
              onTap: (index) {
                cubit.changeScreen(index);
              },
              items: const <Widget>[
                CustomBottomNavigationBarIcon(
                  icon: Icons.my_library_books_sharp,
                ),
                CustomBottomNavigationBarIcon(
                  icon: Icons.attach_money_rounded,
                ),
                CustomBottomNavigationBarIcon(
                  icon: Icons.recycling_rounded,
                ),
                CustomBottomNavigationBarIcon(
                  icon: Icons.person,
                ),
                CustomBottomNavigationBarIcon(
                  icon: Icons.notifications_on_outlined,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

