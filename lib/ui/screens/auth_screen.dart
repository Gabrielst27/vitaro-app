import 'package:flutter/material.dart';
import 'package:vitaro_app/ui/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Text(
                'VITARO',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              Card(
                margin: EdgeInsets.all(24),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Bem-vindo de volta!',
                          style: Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        child: AuthForm(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
