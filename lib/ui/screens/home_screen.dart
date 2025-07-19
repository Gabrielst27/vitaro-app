import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/use_cases/user_signout_usecase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onLogOut});

  final void Function() onLogOut;

  void _logOut() async {
    await UserSignoutUsecase.execute();
    onLogOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vitaro', style: Theme.of(context).textTheme.titleSmall),
        actions: [
          IconButton(
            onPressed: _logOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
