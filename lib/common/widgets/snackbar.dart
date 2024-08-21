import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';

class CommonSnackbar {
  static showCustomSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: AppColors.primaryColor,
      messageText: Text(
        message,
        style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
      ),
      duration: const Duration(seconds: 1),
    );
  }
}
