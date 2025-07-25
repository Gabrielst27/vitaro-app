import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vitaro_app/data/api/dio_client.dart';
import 'package:vitaro_app/data/api/dtos/authenticated_user_dto.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/env.dart';

class UserApiService extends ChangeNotifier {
  final _dio = DioClient().client;
  final int timeoutSeconds = 30;

  Future<Result<AuthenticatedUserDto>> signUp(UserModel user) async {
    try {
      final response = await _dio
          .post(
            '$vitaroApiUrl/users/sign-up',

            data: jsonEncode(<String, dynamic>{
              'name': user.name,
              'email': user.email,
              'password': user.password,
            }),
          )
          .timeout(Duration(seconds: timeoutSeconds));
      if (response.statusCode! >= 400) {
        final errorData = response.data;
        final errorMessage = errorData['message'] ?? 'Erro desconhecido';
        return Result.failure(errorMessage);
      }
      final userDto = AuthenticatedUserMapper.toDto(response.data);
      return Result.success(userDto);
    } catch (error) {
      debugPrint(error.toString());
      final errorMessage = _errorMessage(error);
      return Result.failure(errorMessage);
    }
  }

  Future<Result<AuthenticatedUserDto>> findCurrentUser() async {
    try {
      final response = await _dio
          .get('$vitaroApiUrl/users/find-current-user')
          .timeout(
            Duration(seconds: timeoutSeconds),
            onTimeout: () => throw TimeoutException('Timeout'),
          );
      if (response.statusCode! >= 400) {
        return Result.failure(response.data);
      }
      final userDto = AuthenticatedUserMapper.toDto({...response.data});
      return Result.success(userDto);
    } on TimeoutException {
      return Result.failure(
        'Não foi possível se conectar ao servidor. Tente novamente mais tarde.',
      );
    } catch (error) {
      if (error is DioException) {
        if (error.response!.data['error'] == "auth/id-token-expired") {
          return Result.failure('Expired Token');
        }
        return Result.failure('Erro Dio: ${error.message}');
      }
      return Result.failure('Erro desconhecido: $error');
    }
  }

  String _errorMessage(error) {
    switch (error.response.data['message']) {
      case 'email-already-exists':
        return 'Email já cadastrado';
      default:
        return 'Erro de autenticação: ${error.message}';
    }
  }
}
