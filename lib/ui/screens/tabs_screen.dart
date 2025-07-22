import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/domain/providers/current_user_provider.dart';
import 'package:vitaro_app/domain/use_cases/find_current_user_usecase.dart';
import 'package:vitaro_app/domain/use_cases/user_signout_usecase.dart';
import 'package:vitaro_app/ui/screens/home_screen.dart';
import 'package:vitaro_app/ui/screens/perfil_screen.dart';
import 'package:vitaro_app/ui/screens/workouts_screen.dart';
import 'package:vitaro_app/ui/widgets/drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  late UserModel _currentUser;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _currentUser = ref.read(currentUserProvider);
    Future.microtask(() => _verifyCurrentUser());
  }

  void _verifyCurrentUser() async {
    final storage = FlutterSecureStorage();
    final accessToken = await storage.read(key: 'access_token');
    if (_currentUser.token != accessToken && mounted) {
      final container = ProviderScope.containerOf(context);
      await FindCurrentUserUsecase.execute(container);
    }
  }

  void logOut() async {
    final container = ProviderScope.containerOf(context);
    await UserSignoutUsecase.execute(container);
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
