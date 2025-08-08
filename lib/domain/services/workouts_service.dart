import 'package:flutter/material.dart';
import 'package:vitaro_app/data/api/workout_api_service.dart';
import 'package:vitaro_app/data/static/exercises.dart';
import 'package:vitaro_app/domain/models/exercise_model.dart';
import 'package:vitaro_app/domain/models/series_model.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';

class WorkoutsService extends ChangeNotifier {
  final _workoutApi = WorkoutApiService();
  List<WorkoutModel>? currentUserWorkouts;
  int? currentWorkoutsPage;

  Future<void> findByUser(String id) async {
    try {
      final result = await _workoutApi.findUserWorkouts(id);
      if (!result.isSuccess) {
        throw Exception(result.errorMessage);
      }
      final List<WorkoutModel> workouts = [];
      final data = result.data;
      if (data != null && data.itemsDto != null && data.itemsDto!.isNotEmpty) {
        for (final workoutDto in data.itemsDto!) {
          final WorkoutModel workout = WorkoutModel(
            id: workoutDto.id,
            authorId: workoutDto.authorId,
            title: workoutDto.title,
            goal: workoutDto.goal,
            sport: workoutDto.sport,
            exercises: [],
          );
          final exercisesDto = workoutDto.exercisesDto;
          if (exercisesDto != null && exercisesDto.isNotEmpty) {
            for (final exerciseDto in exercisesDto) {
              final staticExercise = staticExercises.firstWhere(
                (ex) => ex.id == exerciseDto.refId,
              );
              final ExerciseModel exercise = ExerciseModel(
                id: exerciseDto.id,
                name: staticExercise.name,
                muscularGroup: staticExercise.muscularGroup,
                imagePath: staticExercise.imagePath,
                series: [],
              );
              final seriesDto = exerciseDto.seriesDto;
              if (seriesDto != null && seriesDto.isNotEmpty) {
                for (final serieDto in seriesDto) {
                  final SeriesModel serie = SeriesModel(
                    id: serieDto.id,
                    position: serieDto.position,
                    weight: serieDto.weight,
                    reps: serieDto.reps,
                    restInSeconds: serieDto.restInSeconds,
                    technique: serieDto.technique,
                    accessory: serieDto.accessory,
                  );
                  exercise.series!.add(serie);
                }
              }
              workout.exercises.add(exercise);
            }
          }
          workouts.add(workout);
        }
      }
      currentUserWorkouts = workouts;
      currentWorkoutsPage = result.data!.currentPage;
      notifyListeners();
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
