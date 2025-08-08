import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitaro_app/app.dart';
import 'package:vitaro_app/domain/services/auth_service.dart';
import 'package:vitaro_app/domain/services/workouts_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ftqjkmpsphplpdumgipb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0cWprbXBzcGhwbHBkdW1naXBiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQzMzUwMjcsImV4cCI6MjA2OTkxMTAyN30.R6_KPEkewKptg-V03ijX_eSXwT8RW4UcoeTAKieC8t4',
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
