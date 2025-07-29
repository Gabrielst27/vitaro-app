import 'dart:async';
import 'package:vitaro_app/data/api/dio_client.dart';
import 'package:vitaro_app/data/api/dtos/exercise_dto.dart';
import 'package:vitaro_app/data/api/dtos/pagination_dto.dart';
import 'package:vitaro_app/data/api/dtos/serie_dto.dart';
import 'package:vitaro_app/data/api/dtos/workouts_dto.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/env.dart';

final _dio = DioClient().client;

class WorkoutApiService {
  Future<Result<List<WorkoutsDto>>> findUserWorkouts(String userId) async {
    try {
      final result = await _dio
          .get('$vitaroApiUrl/workouts/$userId/user-workouts')
          .timeout(
            Duration(seconds: 12),
            onTimeout: () => throw TimeoutException('timeout'),
          );
      if (result.statusCode! >= 400) {
        return Result.failure('Erro: ${result.data}');
      }
      final PaginationDto paginationDto = PaginationMapper.toDto(result.data);
      final List<WorkoutsDto> workoutsDto = [];
      for (final itemData in paginationDto.items) {
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
      return Result.success(workoutsDto);
    } on TimeoutException {
      return Result.failure(
        'Não foi possível se conectar ao servidor. Tente novamente mais tarde.',
      );
    } catch (error) {
      return Result.failure('Erro inesperado: $error');
    }
  }
}
