import 'package:movies_app/features/movies/controller/movies_controller.dart';
import 'package:movies_app/features/movies/models/movie.dart';
import 'package:test/test.dart';

void main() {
  group('Test start', () {
    test('Test Movie model', () {
      final movie = Movie(
        title: 'Star wars',
        description:
            'A young farm boy joins the Rebel Alliance to fight the oppressive Galactic Empire and destroy its superweapon',
        isFavourite: false,
      );
      expect(
        movie,
        Movie(
          title: 'Star wars',
          description:
              'A young farm boy joins the Rebel Alliance to fight the oppressive Galactic Empire and destroy its superweapon',
          isFavourite: false,
        ),
      );
    });

    test('saveMovie adds a new movie and clears controllers', () {
      MoviesController controller = MoviesController();

      controller.titleCtrl.text = 'Star Wars';
      controller.descriptionCtrl.text =
          'A young farm boy joins the Rebel Alliance to fight the oppressive Galactic Empire and destroy its superweapon';

      controller.saveMovie();
      expect(controller.movies.length, 1);
      expect(controller.movies.first.title, 'Star Wars');
      expect(controller.movies.first.description,
          'A young farm boy joins the Rebel Alliance to fight the oppressive Galactic Empire and destroy its superweapon');
    });
  });
}
