import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:movies_app/constants/app_colors.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final double? height;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.label,
    this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 60,
      child: OutlinedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        child: Text(
          label,
          style: context.textTheme.displayMedium!.copyWith(fontSize: 22),
        ),
      ),
    );
  }
}
