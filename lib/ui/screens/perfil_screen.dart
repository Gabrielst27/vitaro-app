import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key, required this.onLogout});

  final void Function() onLogout;

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -80,
                child: CircleAvatar(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainer,
                  radius: 80,
                  child: Icon(
                    Icons.person,
                    size: 80,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 96),
          Text(
            auth.currentUser!.displayName!,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Divider(),
          const SizedBox(height: 32),
          TextButton.icon(
            onPressed: onLogout,
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
              size: 24,
            ),
            label: Text(
              'Sair',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
