import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/core/components/custom_icon_button.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/features/customer/profile/view_models/cubit/update_profile_cubit.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
    this.onPressed,
    this.image,
  });
  final Function()? onPressed;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        var cubit = context.read<UpdateProfileCubit>();
        return SizedBox(
          child: Stack(
            children: [
              CircleAvatar(
                radius: context.width * 0.2,
                backgroundImage: cubit.file == null
                    ? image != null
                        ? NetworkImage(image!)
                        : null
                    : Image.file(cubit.file!).image,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: AppColors.secondryColor,
                  child: Center(
                    child: CustomIconButton(
                      icon: Icons.upload,
                      onPressed: onPressed,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
