import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vitaro_app/data/api/dtos/authenticated_user_dto.dart';
import 'package:vitaro_app/data/api/dtos/result_dto.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/env.dart';

class UserApiService {
  Future<Result<AuthenticatedUserDto>> signUp(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('$vitaroApiUrl/users/sign-up'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': user.name,
          'email': user.email,
          'password': user.password,
        }),
      );
      if (response.statusCode >= 400) {
        final errorData = json.decode(response.body);
        final errorMessage = errorData['message'] ?? 'Erro desconhecido';
        return Result.failure(errorMessage);
      }
      final Map<String, dynamic> data = json.decode(response.body);
      final userDto = AuthenticatedUserMapper.toDto(data);
      return Result.success(userDto);
    } catch (error) {
      return Result.failure('Erro ao conectar com o servidor: $error');
    }
  }
}
