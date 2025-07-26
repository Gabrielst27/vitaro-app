import 'package:flutter/material.dart';
import 'package:vitaro_app/theme.dart';
import 'package:vitaro_app/ui/widgets/auth_check.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vitaro',
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: AuthCheck(),
    );
  }
}
