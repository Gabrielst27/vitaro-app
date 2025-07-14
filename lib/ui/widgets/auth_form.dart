import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
