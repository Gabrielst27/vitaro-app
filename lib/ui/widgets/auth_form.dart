import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/models/user_model.dart';

class AuthForm extends StatefulWidget {
  final bool isLogin;

  const AuthForm({super.key, required this.isLogin});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _enteredEmail = '';
  String _enteredName = '';
  final _passwordController = TextEditingController();

  void _submit() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      if (widget.isLogin) {
      } else {
        final user = UserModel(
          name: _enteredName,
          email: _enteredEmail,
          password: _passwordController.text,
        );
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
          spacing: 32,
          children: [
            if (!widget.isLogin)
              TextFormField(
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
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
                onSaved: (newValue) => _enteredName = newValue!,
              ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'E-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
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
              onSaved: (newValue) => _enteredEmail = newValue!,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Senha',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
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
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirmar senha',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
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
              onPressed: _submit,
              child: Text(widget.isLogin ? 'Entrar' : 'Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}
