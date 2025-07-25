import 'package:flutter/material.dart';
import 'package:vitaro_app/domain/use_cases/auth_service.dart';
import 'package:vitaro_app/ui/screens/home_screen.dart';
import 'package:vitaro_app/ui/screens/perfil_screen.dart';
import 'package:vitaro_app/ui/screens/workouts_screen.dart';
import 'package:vitaro_app/ui/widgets/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 1;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  void logOut() async {
    await _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('Error: No content.'),
    );
    if (_currentIndex == 0) {
      content = WorkoutsScreen();
    }
    if (_currentIndex == 1) {
      content = HomeScreen();
    }
    if (_currentIndex == 2) {
      content = PerfilScreen(
        onLogout: logOut,
      );
    }
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          drawer: CustomDrawer(),
          body: content,
          bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.fitness_center),
                label: 'Treinos',
              ),
              NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
            ],
            onDestinationSelected: (index) => setState(() {
              _currentIndex = index;
            }),
          ),
        ),
      ),
    );
  }
}
