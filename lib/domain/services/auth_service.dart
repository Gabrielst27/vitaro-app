import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vitaro_app/data/api/auth_api_service.dart';
import 'package:vitaro_app/data/api/user_api_service.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/domain/models/user_model.dart';

class AuthService extends ChangeNotifier {
  final AuthApiService _authApi = AuthApiService();
  final UserApiService _userApi = UserApiService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? authUser;
  UserModel? currentUser;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) async {
      authUser = user;
      if (user != null) {
        final token = await user.getIdToken();
        print(token);
        try {
          await _findCurrentUser();
        } catch (error) {
          debugPrint('ERRO ${error.toString()}');
        }
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
    final credentials = await _auth.signInWithCustomToken(
      result.data!.token,
    );
    final idToken = await credentials.user!.getIdToken();
    final model = UserModel(
      id: result.data!.id,
      name: result.data!.name,
      email: result.data!.email,
      age: result.data!.age,
      height: result.data!.height,
      weight: result.data!.weight,
      token: idToken,
    );
    currentUser = model;
    notifyListeners();
  }

  Future<void> _findCurrentUser() async {
    if (_auth.currentUser == null) {
      throw Exception('Usuário não autenticado nessa porra');
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
    await _auth.signOut();
    currentUser = null;
    notifyListeners();
  }
}
