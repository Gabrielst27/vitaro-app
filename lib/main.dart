import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitaro_app/ui/screens/auth_screen.dart';
import 'package:vitaro_app/theme.dart';
import 'package:vitaro_app/ui/screens/tabs_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const App()));
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
    final storage = FlutterSecureStorage();
    final accessToken = await storage.read(key: 'access_token');
    if (accessToken != null && accessToken.isNotEmpty) {
      setState(() {
        isAuthenticated = true;
      });
    }
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
