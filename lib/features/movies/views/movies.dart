import 'package:flutter/material.dart';
import 'package:movies_app/constants/app_colors.dart';
import 'package:movies_app/features/movies/components/movie_card.dart';
import 'package:movies_app/features/movies/controller/movies_controller.dart';
import 'package:get/get.dart';
import 'package:movies_app/routes/app_routes.dart';

class Movies extends GetView<MoviesController> {
  static const String routeName = '/movie';

  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies',
          style: context.textTheme.displayMedium!
              .copyWith(color: AppColors.primaryColor),
        ),
        foregroundColor: AppColors.primaryColor,
      ),
      body: GetBuilder<MoviesController>(
        builder: (_) {
          return controller.movies.isEmpty
              ? Center(
                  child: Text(
                    'Add Movies to create your list',
                    style: context.textTheme.titleMedium!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) =>
                      MovieCard(movie: controller.movies[index], index: index),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12.0),
                  itemCount: controller.movies.length,
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Movie',
        onPressed: () {
          Get.toNamed(AppRoutes.movieForm);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
