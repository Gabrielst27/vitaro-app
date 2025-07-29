import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vitaro_app/data/api/workout_api_service.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';

class WorkoutsService extends ChangeNotifier {
  final _workoutApi = WorkoutApiService();
  final _auth = FirebaseAuth.instance;
  List<WorkoutModel>? currentUserWorkouts;

  Future<void> findByCurrentUser() async {
    final id = _auth.currentUser?.uid;
    if (id == null) {
      throw Exception('Usuário não autenticado');
    }
    try {
      final result = await _workoutApi.findUserWorkouts(id);
      if (!result.isSuccess) {
        throw Exception(result.errorMessage);
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
