import 'package:flutter/material.dart';
import 'package:revive/core/components/custom_text_form_field_with_title.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.addressController, required this.voucher,
  });
  final TextEditingController nameController,
      emailController,
      addressController;
  final String voucher;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.width * 0.03,
        right: context.width * 0.03,
        top: context.height * 0.03,
      ),
      child: Column(
        spacing: context.height * 0.01,
        children: [
          CustomTextFormFieldWithTitle(
            title: "User Name",
            hintText: nameController.text,
            controller: nameController,
          ),
          CustomTextFormFieldWithTitle(
            title: "User Email",
            hintText: emailController.text,
            controller: emailController,
            enable: false,
          ),
          CustomTextFormFieldWithTitle(
            title: "User Address",
            hintText: addressController.text,
            controller: addressController,
          ),
          CustomTextFormFieldWithTitle(
            title: "My Voucher",
            hintText: voucher,
            enable: false,
          ),
        ],
      ),
    );
  }
}
