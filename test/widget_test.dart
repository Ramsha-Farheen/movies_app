// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:movies_app/features/movies/components/movie_card.dart';
import 'package:movies_app/features/movies/components/movie_form.dart';
import 'package:movies_app/features/movies/controller/movies_controller.dart';
import 'package:movies_app/features/movies/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Test start', () {
    testWidgets('Save Movie', (WidgetTester tester) async {
      // MoviesController controller = MoviesController();
      var prefs = await SharedPreferences.getInstance();
      Get.put(MoviesController());
      await tester.pumpWidget(const MovieForm());
      var submitBtn = find.byType(TextButton);
      await tester.tap(submitBtn);
      await tester.pump();
      expect(find.text('Movie Added'), findsOneWidget);
    });

    testWidgets('Favourite Button Test', (WidgetTester tester) async {
      final movie = Movie(
        title: 'Star wars',
        description:
            'A young farm boy joins the Rebel Alliance to fight the oppressive Galactic Empire and destroy its superweapon',
        isFavourite: false,
      );
      await tester.pumpWidget(
        MovieCard(
          movie: movie,
          index: 1,
        ),
      );
      var submitBtn = find.byType(IconButton);
      await tester.tap(submitBtn);
      await tester.pump();
      expect(find.widgetWithIcon(IconData, CupertinoIcons.heart_solid),
          findsOneWidget);
    });
  });
}
