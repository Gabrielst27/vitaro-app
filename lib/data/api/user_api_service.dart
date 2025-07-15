import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vitaro_app/data/api/dtos/authenticated_user_dto.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/env/env.dart';

class UserApiService {
  Future<void> signUp(UserModel user) async {
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
      final Map<String, dynamic> data = json.decode(response.body);
      final userDto = AuthenticatedUserMapper.toDto(data);
      print(userDto);
    } catch (error) {
      throw Exception('Erro: $error');
    }
  }
}
