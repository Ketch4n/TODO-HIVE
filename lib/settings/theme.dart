import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.amber,
    onPrimary: Colors.black,
    secondary: Colors.white,
    onSecondary: Colors.black26,
    error: Colors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.amber.shade200,
    onSurface: Colors.black,
  ),
  primaryColor: Colors.amber,
  cardColor: Colors.amber.shade200,
  scaffoldBackgroundColor: Colors.white,
);
