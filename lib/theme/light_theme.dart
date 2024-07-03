import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData data = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.pink[800]!,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.pink[800]!,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.pink,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.pink[800],
        fontWeight: FontWeight.w400,
      ),
      // For buttons text
      labelLarge: TextStyle(
        fontSize: 16,
        color: Colors.pink[800],
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.black54,
    ),
    cardTheme: CardTheme(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide.none,
      ),
    ),
  );
}
