import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/common/widgets/common_text_field.dart';
import 'package:movies_app/common/widgets/primary_button.dart';
import 'package:movies_app/constants/app_colors.dart';
import 'package:movies_app/features/movies/controller/movies_controller.dart';

class MovieForm extends GetView<MoviesController> {
  static const String routeName = '/addMovie';

  const MovieForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Movie',
          style: context.textTheme.displayMedium!
              .copyWith(color: AppColors.primaryColor),
        ),
        foregroundColor: AppColors.primaryColor,
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              CommonTextField(
                isRequired: true,
                labelText: 'Movie Name',
                controller: controller.titleCtrl,
                hintText: 'xyz name',
                prefixIcon: Icons.movie_rounded,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 24),
              CommonTextField(
                isRequired: true,
                labelText: 'Movie Description',
                controller: controller.descriptionCtrl,
                hintText: 'xyz description',
                prefixIcon: Icons.description,
                textInputAction: TextInputAction.done,
              ),
              const Spacer(),
              PrimaryButton(
                label: 'Save',
                onPressed: () {
                  controller.saveMovie();
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
