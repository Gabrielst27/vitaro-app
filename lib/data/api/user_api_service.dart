import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:vitaro_app/data/api/dtos/authenticated_user_dto.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/env.dart';

final _firebaseAuth = FirebaseAuth.instance;

class UserApiService {
  Future<Result<AuthenticatedUserDto>> signUp(UserModel user) async {
    try {
      final response = await http
          .post(
            Uri.parse('$vitaroApiUrl/users/sign-up'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'name': user.name,
              'email': user.email,
              'password': user.password,
            }),
          )
          .timeout(const Duration(seconds: 20));
      if (response.statusCode >= 400) {
        final errorData = json.decode(response.body);
        final errorMessage = errorData['message'] ?? 'Erro desconhecido';
        return Result.failure(errorMessage);
      }
      final Map<String, dynamic> data = json.decode(response.body);
      final userDto = AuthenticatedUserMapper.toDto(data);
      final credentials = await _firebaseAuth.signInWithCustomToken(
        userDto.token,
      );
      final idToken = await credentials.user!.getIdToken();
      userDto.updateToken(idToken!);
      return Result.success(userDto);
    } catch (error) {
      return Result.failure('Erro ao conectar com o servidor: $error');
    }
  }

  Future<Result<AuthenticatedUserDto>> signIn(
    String email,
    String password,
  ) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credentials.user == null) {
        return Result.failure('Email ou senha incorretos');
      }
      final idToken = await credentials.user!.getIdToken();
      final response = await http
          .post(
            Uri.parse('$vitaroApiUrl/users/sign-in'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'idToken': idToken,
            }),
          )
          .timeout(const Duration(seconds: 20));
      if (response.statusCode >= 400) {
        final errorData = json.decode(response.body);
        final errorMessage = errorData['message'] ?? 'Erro desconhecido';
        return Result.failure(errorMessage);
      }
      final Map<String, dynamic> data = json.decode(response.body);
      final userDto = AuthenticatedUserMapper.toDto({...data});
      userDto.updateToken(idToken!);
      return Result.success(userDto);
    } on FirebaseAuthException catch (error) {
      final errorMessage = _firebaseAuthErrorMessage(error.code);
      return Result.failure(errorMessage);
    } catch (error) {
      return Result.failure('Erro ao conectar com o servidor: $error');
    }
  }

  String _firebaseAuthErrorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return 'O e-mail informado é inválido.';
      case 'user-disabled':
        return 'Este usuário está desativado.';
      case 'user-not-found':
        return 'Usuário não encontrado.';
      case 'wrong-password':
        return 'Senha incorreta.';
      case 'network-request-failed':
        return 'Sem conexão com a internet.';
      default:
        return 'Erro na autenticação: $code';
    }
  }
}
