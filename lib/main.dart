import 'package:flutter/material.dart';
import 'package:vitaro_app/screens/auth_screen.dart';
import 'package:vitaro_app/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const AuthScreen(),
    );
  }
}
