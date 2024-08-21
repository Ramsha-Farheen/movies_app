import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/common/widgets/secondary_button.dart';
import 'primary_button.dart';

class ConfirmationDialog {
  static showConfirmationDialog(
      String title, String message, VoidCallback onConfirm) {
    Get.dialog(
      AlertDialog(
        title: Center(
          child: Text(
            title,
            style: Get.textTheme.displayLarge,
          ),
        ),
        content: Text(
          message,
          style: Get.textTheme.displaySmall!.copyWith(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  label: 'Yes',
                  height: 48,
                  onPressed: onConfirm,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SecondaryButton(
                  label: 'No',
                  height: 48,
                  onPressed: Get.back,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
