import 'package:flutter/material.dart';

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 55, 0, 255),
  primary: const Color.fromARGB(255, 255, 102, 0),
);

final darkTheme = ThemeData().copyWith(
  colorScheme: darkColorScheme,
  scaffoldBackgroundColor: darkColorScheme.surface,
  textTheme: TextTheme().copyWith(
    titleLarge: TextStyle(
      fontSize: 26,
      color: darkColorScheme.primary,
      fontWeight: FontWeight.bold,
    ),
  ),
);
