import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitaro_app/data/api/auth_api_service.dart';
import 'package:vitaro_app/data/api/user_api_service.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/main.dart';

class AuthService extends ChangeNotifier {
  final AuthApiService _authApi = AuthApiService();
  final UserApiService _userApi = UserApiService();
  User? authUser;
  UserModel? currentUser;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    supabase.auth.onAuthStateChange.listen((event) async {
      final session = event.session;
      if (session != null) {
        if (session.isExpired) {
          try {
            await supabase.auth.refreshSession();
          } catch (error) {
            authUser = null;
          }
        }
        authUser = session.user;
        try {
          await _findCurrentUser();
        } catch (error) {
          print('ERROR $error');
        }
      } else {
        authUser = null;
      }
      isLoading = false;
      notifyListeners();
    });
  }

  Future<Result<void>> signIn(
    String email,
    String password,
  ) async {
    final result = await _authApi.signIn(email, password);
    if (!result.isSuccess) {
      return Result.failure(result.errorMessage);
    }
    return Result.successEmpty();
  }

  Future<void> signUp(
    UserModel user,
  ) async {
    final result = await _userApi.signUp(user);
    if (!result.isSuccess) {
      throw Exception(result.errorMessage);
    }
    await _authApi.signIn(user.email, user.password!);
    final model = UserModel(
      id: result.data!.id,
      name: result.data!.name,
      email: result.data!.email,
      age: result.data!.age,
      height: result.data!.height,
      weight: result.data!.weight,
      token: result.data!.token,
    );
    currentUser = model;
    notifyListeners();
  }

  Future<void> _findCurrentUser() async {
    if (authUser == null) {
      throw Exception('Usuário não autenticado');
    }
    final result = await _userApi.findCurrentUser();
    if (!result.isSuccess) {
      throw Exception('Usuário não encontrado');
    }
    final model = UserModel(
      id: result.data!.id,
      name: result.data!.name,
      email: result.data!.email,
      age: result.data!.age,
      height: result.data!.height,
      weight: result.data!.weight,
      token: result.data!.token,
    );
    currentUser = model;
    notifyListeners();
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    currentUser = null;
    notifyListeners();
  }
}
