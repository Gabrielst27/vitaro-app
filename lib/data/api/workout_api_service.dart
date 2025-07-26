import 'dart:async';

import 'package:vitaro_app/data/api/dio_client.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/domain/models/workouts_model.dart';
import 'package:vitaro_app/env.dart';

final _dio = DioClient().client;

class WorkoutApiService {
  Future<Result<WorkoutModel>> findUserWorkouts(String userId) async {
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
      throw Exception('TODO');
    } on TimeoutException {
      return Result.failure(
        'Não foi possível se conectar ao servidor. Tente novamente mais tarde.',
      );
    } catch (error) {
      return Result.failure('Erro inesperado: $error');
    }
  }
}
