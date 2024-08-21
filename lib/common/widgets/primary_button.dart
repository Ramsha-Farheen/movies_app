import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool loading;
  final double? height;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: loading
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 4,
              )
            : Text(label,
                style: context.textTheme.displayMedium!
                    .copyWith(fontSize: 22, color: Colors.white)),
      ),
    );
  }
}
