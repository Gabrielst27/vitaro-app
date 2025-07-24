import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitaro_app/data/api/dio_client.dart';
import 'package:vitaro_app/data/api/dtos/authenticated_user_dto.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/env.dart';

final _firebaseAuth = FirebaseAuth.instance;
final _dio = DioClient().client;

class UserApiService {
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
          .timeout(const Duration(seconds: 20));
      if (response.statusCode! >= 400) {
        final errorData = response.data;
        final errorMessage = errorData['message'] ?? 'Erro desconhecido';
        return Result.failure(errorMessage);
      }
      final Map<String, dynamic> data = response.data;
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

  Future<Result<void>> signIn(
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
      final storage = FlutterSecureStorage();
      await storage.write(key: 'access_token', value: idToken);
      return Result.success({});
    } on FirebaseAuthException catch (error) {
      final errorMessage = _firebaseAuthErrorMessage(error.code);
      return Result.failure(errorMessage);
    } catch (error) {
      return Result.failure('Erro ao conectar com o servidor: $error');
    }
  }

  Future<Result<AuthenticatedUserDto>> findCurrentUser() async {
    try {
      final response = await _dio
          .get('$vitaroApiUrl/users/find-current-user')
          .timeout(Duration(seconds: 12));
      if (response.statusCode! >= 400) {
        return Result.failure(response.data);
      }
      final Map<String, dynamic> data = response.data;
      final userDto = AuthenticatedUserMapper.toDto({...data});
      return Result.success(userDto);
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
