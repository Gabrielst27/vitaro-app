import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vitaro_app/ui/screens/auth_screen.dart';
import 'package:vitaro_app/theme.dart';
import 'package:vitaro_app/ui/screens/tabs_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const InitApp(),
    );
  }
}

class InitApp extends StatefulWidget {
  const InitApp({super.key});

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    setState(() {
      isAuthenticated = token != null && token.isNotEmpty;
    });
  }

  void onLoginSuccess() {
    setState(() {
      isAuthenticated = true;
    });
  }

  void onLogOut() {
    setState(() {
      isAuthenticated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAuthenticated
        ? TabsScreen(
            onLogOut: onLogOut,
          )
        : AuthScreen(onLoginSuccess: onLoginSuccess);
  }
}
