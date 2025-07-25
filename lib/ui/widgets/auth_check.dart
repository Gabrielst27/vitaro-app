import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitaro_app/domain/services/auth_service.dart';
import 'package:vitaro_app/ui/screens/auth_screen.dart';
import 'package:vitaro_app/ui/screens/splash_screen.dart';
import 'package:vitaro_app/ui/screens/tabs_screen.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return auth.isLoading
        ? const SplashScreen()
        : auth.authUser == null
        ? const AuthScreen()
        : const TabsScreen();
  }
}
