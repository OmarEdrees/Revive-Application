import 'package:flutter/material.dart';
import 'package:revive/core/utilies/colors/app_colors.dart';
import 'package:revive/core/utilies/extensions/app_extensions.dart';
import 'package:revive/core/utilies/styles/app_text_styles.dart';

class CustomTextFormFieldWithTitle extends StatefulWidget {
  const CustomTextFormFieldWithTitle({
    super.key,
    required this.hintText,
    required this.title,
    this.isPassword = false,
    this.controller,
    this.enableValidator = true, this.maxLines = 1, this.enable,
  });
  final String hintText;
  final String title;
  final bool isPassword, enableValidator;
  final TextEditingController? controller;
  final int maxLines;
  final bool? enable;
  @override
  State<CustomTextFormFieldWithTitle> createState() =>
      _CustomTextFormFieldWithTitleState();
}

class _CustomTextFormFieldWithTitleState
    extends State<CustomTextFormFieldWithTitle> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.title18PrimaryColorW500,
        ),
        SizedBox(height: context.height * 0.003),
        TextFormField(
          controller: widget.controller,
          validator: widget.enableValidator
              ? (value) =>
                  value!.isEmpty ? "Field ${widget.title} is required" : null
              : null,
          obscureText: widget.isPassword ? isPassword : false,
          enabled: widget.enable,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.grey.withOpacity(0.2),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    icon: Icon(
                      isPassword ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.primaryColor,
                    ),
                  )
                : null,
          ),
          maxLines: widget.maxLines,
        )
      ],
    );
  }
}
