import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/common/widgets/snackbar.dart';
import 'package:movies_app/features/movies/models/movie.dart';
import 'package:movies_app/service/movie_service.dart';

class MoviesController extends GetxController {
  late TextEditingController titleCtrl;
  late TextEditingController descriptionCtrl;
  late GlobalKey<FormState> formKey;

  List<Movie> movies = [];

  @override
  void onInit() {
    titleCtrl = TextEditingController();
    descriptionCtrl = TextEditingController();
    formKey = GlobalKey<FormState>();
    movies = MovieService().getMoviesList();
    super.onInit();
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    descriptionCtrl.dispose();
    super.dispose();
  }

  saveMovie() {
    if (formKey.currentState!.validate()) {
      movies.add(
        Movie(title: titleCtrl.text, description: descriptionCtrl.text),
      );
      MovieService().saveMovies(movies);
      titleCtrl.clear();
      descriptionCtrl.clear();
      Get.back();
    }
    CommonSnackbar.showCustomSnackbar(
        'Movie Added', 'Your Movie have been added to the list successfully!');
    update();
  }

  deleteMovie(int index) {
    movies.removeAt(index);
    MovieService().saveMovies(movies);
    update();
  }

  addRemoveFavourite({
    required Movie movie,
    required int index,
    required bool isFavourite,
  }) {
    movie.isFavourite = isFavourite;
    MovieService().saveMovies(movies);
    update();
  }
}
