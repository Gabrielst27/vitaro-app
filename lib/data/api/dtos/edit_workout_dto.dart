import 'dart:convert';
import 'package:vitaro_app/data/api/dtos/edit_exercise_dto.dart';
import 'package:vitaro_app/domain/enums/sports_enum.dart';
import 'package:vitaro_app/domain/enums/workout_goals_enum.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';

class EditWorkoutDto {
  final String id;
  final String title;
  final EWorkoutGoals goal;
  final ESports sport;
  final List<EditExerciseDto> exercises;

  EditWorkoutDto({
    required this.id,
    required this.title,
    required this.goal,
    required this.sport,
    required this.exercises,
  });
}

class EditWorkoutMapper {
  static String toDtoJson(WorkoutModel model) {
    final exercises = model.exercises
        .map((exercise) => EditExcerciseMapper.toDto(exercise))
        .toList();
    return jsonEncode(<String, dynamic>{
      'id': model.id,
      'title': model.title,
      'goal': model.goal.name.toString(),
      'sport': model.sport.name.toString(),
      'exercises': exercises,
    });
  }
}
