import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF6F8FC),
    cardColor: Colors.white,
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(elevation: 0),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0E1217),
    cardColor: const Color(0xFF1B232E),
    primaryColor: Colors.blue.shade200,
    appBarTheme: const AppBarTheme(elevation: 0),
  );
}