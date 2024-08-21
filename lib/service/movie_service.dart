import 'dart:convert';

import 'package:movies_app/features/movies/models/movie.dart';
import 'package:movies_app/main.dart';

class MovieService {
  Future<bool> saveMovies(List<Movie> movies) {
    List<String> moviesString =
        movies.map((movie) => jsonEncode(movie.toMap())).toList();
    return prefs.setStringList('movies', moviesString);
  }

  List<Movie> getMoviesList() {
    List<String>? movies = prefs.getStringList('movies');
    return movies?.map((movie) => Movie.fromMap(json.decode(movie))).toList() ??
        [];
  }
}
