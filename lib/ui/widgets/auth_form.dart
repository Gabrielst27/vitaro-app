import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/domain/use_cases/user_signin_usecase.dart';
import 'package:vitaro_app/domain/use_cases/user_signup_usecase.dart';

class AuthForm extends StatefulWidget {
  final bool isLogin;
  final void Function() onLoginSuccess;

  const AuthForm({
    super.key,
    required this.isLogin,
    required this.onLoginSuccess,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  String _enteredEmail = '';
  String _enteredName = '';
  bool _isLoading = false;

  void _submit() async {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState!.save();
      final container = ProviderScope.containerOf(context);
      if (widget.isLogin) {
        final signIn = await UserSigninUsecase.execute(
          container,
          _enteredEmail,
          _passwordController.text.trim(),
        );
        setState(() {
          _isLoading = false;
        });
        if (!signIn.isSuccess) {
          if (mounted) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro: ${signIn.errorMessage}')),
            );
          }
        } else {
          setState(() {
            widget.onLoginSuccess();
          });
        }
      } else {
        final user = UserModel(
          name: _enteredName,
          email: _enteredEmail,
          password: _passwordController.text.trim(),
        );
        final signUp = await UserSignupUsecase.execute(user);
        setState(() {
          _isLoading = false;
        });
        if (!signUp.isSuccess) {
          if (mounted) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro: ${signUp.errorMessage}')),
            );
          }
        } else {
          setState(() {
            widget.onLoginSuccess();
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 24,
          children: [
            if (!widget.isLogin)
              TextFormField(
                enabled: !_isLoading,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 4 ||
                      value.length > 48) {
                    return 'O nome deve ter entre 4 e 48 caracteres';
                  }
                  return null;
                },
                onSaved: (newValue) => _enteredName = newValue!.trim(),
              ),
            TextFormField(
              enabled: !_isLoading,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 12,
                ),
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 12 ||
                    value.length > 72) {
                  return 'O email deve ter entre 12 e 72 caracteres';
                }
                if (!value.contains('@')) {
                  return 'Insira um e-mail válido';
                }
                return null;
              },
              onSaved: (newValue) => _enteredEmail = newValue!.trim(),
            ),
            TextFormField(
              enabled: !_isLoading,
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 12,
                ),
                hintText: 'Senha',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                filled: true,
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.length < 6 ||
                    value.length > 64) {
                  return 'A senha deve ter entre 6 e 64 caracteres';
                }
                return null;
              },
            ),
            if (!widget.isLogin)
              TextFormField(
                enabled: !_isLoading,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                  hintText: 'Confirmar senha',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'As senhas devem ser iguais';
                  }
                  return null;
                },
              ),
            ElevatedButton(
              onPressed: _isLoading ? null : _submit,
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text(widget.isLogin ? 'Entrar' : 'Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}
