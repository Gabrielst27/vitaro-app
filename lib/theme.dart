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
    style: TextButton.styleFrom(textStyle: const TextStyle(fontSize: 14)),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: TextStyle(
      fontSize: 14,
      color: darkColorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme().copyWith(
    titleLarge: TextStyle(
      fontSize: 32,
      color: darkColorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      color: darkColorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
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
