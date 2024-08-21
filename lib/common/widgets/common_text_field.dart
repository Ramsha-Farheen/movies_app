// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onObscureIconTap;
  final bool isRequired;
  final Function? validator;
  final VoidCallback? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final TextInputType textInputType;
  final EdgeInsets? padding;

  const CommonTextField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onObscureIconTap,
    this.isRequired = false,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        } else {
          if ((value == null || value.isEmpty) && isRequired) {
            return 'Enter $labelText';
          }
          return null;
        }
      },
      controller: controller,
      onChanged: (v) {},
      readOnly: readOnly,
      decoration: InputDecoration(
        errorStyle: context.textTheme.displaySmall!.copyWith(color: Colors.red),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        enabled: !readOnly,
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
                color: readOnly ? AppColors.disabled : AppColors.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
                color: readOnly ? AppColors.disabled : AppColors.primaryColor)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red)),
        disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
                color: readOnly ? AppColors.disabled : AppColors.primaryColor)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red)),
        labelText: labelText,
        labelStyle: context.textTheme.bodyMedium!.copyWith(
            color: readOnly ? AppColors.disabled : AppColors.primaryColor),
        hintStyle:
            context.textTheme.bodyMedium!.copyWith(color: AppColors.disabled),
        hintText: hintText,
        contentPadding: padding ?? const EdgeInsets.all(12),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: 28,
                color: readOnly ? AppColors.disabled : AppColors.primaryColor,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onObscureIconTap,
                child: Icon(
                  suffixIcon,
                  size: 28,
                  color: AppColors.lightPurple,
                ),
              )
            : null,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      onFieldSubmitted: (value) => onFieldSubmitted?.call(),
      keyboardType: textInputType,
    );
  }
}
