import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitaro_app/domain/services/auth_service.dart';
import 'package:vitaro_app/domain/services/workouts_service.dart';
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
  late AuthService _authService;
  late WorkoutsService _workoutsService;

  void logOut() async {
    await _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    _authService = context.watch<AuthService>();
    _workoutsService = context.watch<WorkoutsService>();
    if (_workoutsService.currentUserWorkouts == null) {
      _workoutsService.findByCurrentUser();
    }
    Widget content = Center(
      child: Text('Error: No content.'),
    );
    if (_currentIndex == 0) {
      content = WorkoutsScreen(
        workouts: _workoutsService.currentUserWorkouts ?? [],
      );
    }
    if (_currentIndex == 1) {
      content = HomeScreen();
    }
    if (_currentIndex == 2) {
      content = PerfilScreen(
        user: _authService.currentUser,
        onLogout: logOut,
      );
    }
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          drawer: _currentIndex == 0 ? CustomDrawer() : null,
          body: content,
          floatingActionButton: _currentIndex == 0
              ? ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(72, 44),
                  ),
                  child: Icon(Icons.add, size: 24),
                )
              : null,
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
