import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    secondary: Colors.blue[800]!,
    tertiary: Colors.purple[800]!,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey[800]!,
    secondary: Colors.white,
    tertiary: Colors.blue[600]!,
  ),
);
