import 'dart:async';
import 'package:vitaro_app/data/api/dio_client.dart';
import 'package:vitaro_app/data/api/dtos/edit_workout_dto.dart';
import 'package:vitaro_app/data/api/dtos/exercise_dto.dart';
import 'package:vitaro_app/data/api/dtos/pagination_dto.dart';
import 'package:vitaro_app/data/api/dtos/serie_dto.dart';
import 'package:vitaro_app/data/api/dtos/workouts_dto.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/env.dart';

final _dio = DioClient().client;

class WorkoutApiService {
  final int timeoutSeconds = 30;

  Future<Result<PaginationDto<WorkoutsDto>>> findUserWorkouts(
    String userId,
  ) async {
    try {
      final result = await _dio
          .get('$vitaroApiUrl/workouts/users/$userId/user-workouts')
          .timeout(
            Duration(seconds: timeoutSeconds),
            onTimeout: () => throw TimeoutException('timeout'),
          );
      if (result.statusCode! >= 400) {
        return Result.failure(_errorMessages(result.data['message']));
      }
      final PaginationDto<WorkoutsDto> paginationDto = PaginationMapper.toDto(
        result.data,
      );
      final List<WorkoutsDto> workoutsDto = [];
      for (final itemData in paginationDto.itemsResponse) {
        final WorkoutsDto workoutDto = WorkoutsMapper.toDto(itemData);
        final List<ExerciseDto> exercisesDto = [];
        for (final exercise in workoutDto.exercisesResponse) {
          final ExerciseDto exerciseDto = ExcerciseMapper.toDto(exercise);
          exerciseDto.seriesDto = [];
          for (final serie in exerciseDto.seriesResponse) {
            final SerieDto serieDto = SerieMapper.toDto(serie);
            exerciseDto.seriesDto!.add(serieDto);
          }
          exercisesDto.add(exerciseDto);
        }
        workoutDto.exercisesDto = exercisesDto;
        workoutsDto.add(workoutDto);
      }
      paginationDto.itemsDto = workoutsDto;
      return Result.success(paginationDto);
    } on TimeoutException {
      return Result.failure(
        'Não foi possível se conectar ao servidor. Tente novamente mais tarde.',
      );
    } catch (error) {
      return Result.failure('Erro inesperado: $error');
    }
  }

  Future<Result<WorkoutsDto>> editWorkout(
    WorkoutModel workout,
  ) async {
    final String dto = EditWorkoutMapper.toDtoJson(workout);
    try {
      final response = await _dio
          .put(
            '$vitaroApiUrl/workouts/edit-workout',
            data: dto,
          )
          .timeout(Duration(seconds: timeoutSeconds));
      if (response.statusCode! >= 400) {
        return Result.failure(_errorMessages(response.data['message']));
      }
      throw Exception('todo');
    } on TimeoutException {
      return Result.failure(
        'Não foi possível se conectar ao servidor. Tente novamente mais tarde.',
      );
    } catch (error) {
      return Result.failure('Erro inesperado: $error');
    }
  }

  String _errorMessages(String code) {
    switch (code) {
      case 'workout-not-found':
        return 'O treino em questão não foi encontrado';
      case 'user-not-authenticated':
        return 'Usuário não autenticado';
      case 'forbidden':
        return 'Você não tem permissão para modificar esse treino';
      default:
        return 'Erro: $code';
    }
  }
}
