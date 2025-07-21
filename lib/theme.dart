import 'package:flutter/material.dart';

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 0, 17, 255),
  primary: const Color.fromARGB(255, 255, 102, 0),
  onPrimary: const Color.fromARGB(255, 255, 255, 255),
);

final darkTheme = ThemeData().copyWith(
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  navigationBarTheme: NavigationBarThemeData().copyWith(
    backgroundColor: darkColorScheme.surfaceContainer,
    indicatorColor: darkColorScheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(50),
      backgroundColor: darkColorScheme.primary,
      foregroundColor: darkColorScheme.onPrimary,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 18)),
  ),
  textTheme: TextTheme().copyWith(
    titleLarge: TextStyle(
      fontSize: 48,
      color: darkColorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 40,
      color: darkColorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 32,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
    ),
  ),
);
