// test/views/movie_form_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/features/movies/components/movie_form.dart';
import 'package:movies_app/features/movies/controller/movies_controller.dart';
import 'package:movies_app/features/movies/models/movie.dart';

class MockMoviesController extends Mock implements MoviesController {}

void main() {
  late MockMoviesController mockMoviesController;

  setUp(() {
    mockMoviesController = MockMoviesController();
    when(mockMoviesController.formKey).thenReturn(GlobalKey<FormState>());
    when(mockMoviesController.titleCtrl).thenReturn(TextEditingController());
    when(mockMoviesController.descriptionCtrl)
        .thenReturn(TextEditingController());
    when(mockMoviesController.movies).thenReturn([]);
    Get.put<MoviesController>(mockMoviesController);
  });

  testWidgets('Form validation and movie list update',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MovieForm(),
    );
    await tester.tap(find.text('Save Movie'));
    await tester.pump(); // Trigger a frame
    expect(find.text('Enter Movie Name'), findsOneWidget);
    expect(find.text('Enter Movie Description'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField).at(0), 'Star Wars');
    await tester.enterText(find.byType(TextFormField).at(1),
        'A young farm boy joins the Rebel Alliance...');
    await tester.tap(find.text('Save Movie'));
    await tester.pump();
    verify(mockMoviesController.saveMovie()).called(1);
    verify(mockMoviesController.titleCtrl.clear()).called(1);
    verify(mockMoviesController.descriptionCtrl.clear()).called(1);
    verify(mockMoviesController.movies.add(
      Movie(
        title: 'Star Wars',
        description: 'A young farm boy joins the Rebel Alliance...',
      ),
    )).called(1);
  });
}
