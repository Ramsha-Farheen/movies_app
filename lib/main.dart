import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movies_app/features/movies/binding/movies_binding.dart';
import 'package:movies_app/routes/app_pages.dart';
import 'package:movies_app/routes/app_routes.dart';
import 'package:movies_app/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movies App',
      theme: themeData(context),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.movies,
      initialBinding: MoviesBinding(),
    );
  }
}
