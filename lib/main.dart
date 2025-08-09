import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitaro_app/app.dart';
import 'package:vitaro_app/domain/services/auth_service.dart';
import 'package:vitaro_app/domain/services/workouts_service.dart';
import 'package:vitaro_app/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => WorkoutsService()),
      ],
      child: const App(),
    ),
  );
}

final supabase = Supabase.instance.client;
