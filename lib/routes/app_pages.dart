import 'package:get/get.dart';
import 'package:movies_app/features/movies/binding/movies_binding.dart';
import 'package:movies_app/features/movies/components/movie_form.dart';
import 'package:movies_app/features/movies/views/movies.dart';
import 'package:movies_app/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      preventDuplicates: true,
      name: AppRoutes.movies,
      page: () => const Movies(),
      binding: MoviesBinding(),
    ),
    GetPage(
      preventDuplicates: true,
      name: AppRoutes.movieForm,
      page: () => const MovieForm(),
      binding: MoviesBinding(),
    ),
    // GetPage(
    //   preventDuplicates: true,
    //   name: AppRoutes.users,
    //   page: () => const Users(),
    //   binding: UsersBinding(),
    // ),
  ];
}
