import 'package:flutter/material.dart';

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 55, 0, 255),
  primary: const Color.fromARGB(255, 255, 102, 0),
  onPrimary: const Color.fromARGB(255, 255, 255, 255),
);

final darkTheme = ThemeData().copyWith(
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(50),
      backgroundColor: darkColorScheme.primary,
      foregroundColor: darkColorScheme.onPrimary,
    ),
  ),
  textTheme: TextTheme().copyWith(
    titleLarge: TextStyle(
      fontSize: 56,
      color: darkColorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 48,
      color: darkColorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 40,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
    ),
  ),
);
