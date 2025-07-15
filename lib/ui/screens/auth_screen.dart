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
      body: SafeArea(
        child: Column(
          children: [
            if (_isLogin)
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'VITARO',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            Expanded(
              flex: 3,
              child: Card(
                margin: EdgeInsets.only(top: _isLogin ? 0 : 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(128),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    _isLogin ? 'Login' : 'Cadastro',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                AuthForm(
                                  isLogin: _isLogin,
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
