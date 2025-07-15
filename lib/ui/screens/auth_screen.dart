import 'package:flutter/material.dart';
import 'package:vitaro_app/ui/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        spacing: _isLogin ? 128 : 64,
        children: [
          Center(
            child: Text(
              'VITARO',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.only(
                  topLeft: Radius.circular(128),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  top: 24,
                  right: 24,
                  bottom: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _isLogin ? 'Login' : 'Cadastro',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      child: AuthForm(
                        isLogin: _isLogin,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(
                        _isLogin
                            ? 'Ainda não tenho conta'
                            : 'Já tenho uma conta',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
