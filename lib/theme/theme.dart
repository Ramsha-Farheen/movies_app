import 'package:flutter/material.dart';
import 'text_theme.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    textTheme: textTheme,
    primarySwatch: Colors.deepPurple,
    primaryColor: Colors.white,
    indicatorColor: Colors.deepPurple,
    hintColor: const Color(0xFFB39DDB),
    highlightColor: Colors.deepPurple,
    hoverColor: Colors.deepPurple,
    focusColor: Colors.deepPurple,
    disabledColor: Colors.deepPurple,
    cardColor: Colors.deepPurple,
    canvasColor: Colors.deepPurple,
    brightness: Brightness.light,
    buttonTheme: Theme.of(context)
        .buttonTheme
        .copyWith(colorScheme: const ColorScheme.light()),
    appBarTheme: const AppBarTheme(elevation: 0.0),
    useMaterial3: true,
  );
}
