import 'package:vitaro_app/domain/enums/sports_enum.dart';
import 'package:vitaro_app/domain/enums/workout_goals_enum.dart';
import 'package:vitaro_app/domain/models/exercise_model.dart';

class WorkoutModel {
  final String id;
  final String authorId;
  final String title;
  final EWorkoutGoals goal;
  final ESports sport;
  final List<ExerciseModel> exercises;

  WorkoutModel({
    required this.id,
    required this.authorId,
    required this.title,
    required this.goal,
    required this.sport,
    required this.exercises,
  });
}
