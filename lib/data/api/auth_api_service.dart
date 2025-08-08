import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/main.dart';

class AuthApiService {
  // Future<Result<void>> signIn(
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     final credentials = await _firebaseAuth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     if (credentials.user == null) {
  //       return Result.failure('Usuário está desativado');
  //     }
  //     return Result.successEmpty();
  //   } on FirebaseAuthException catch (error) {
  //     final errorMessage = _firebaseAuthErrorMessage(error.code);
  //     return Result.failure(errorMessage);
  //   } catch (error) {
  //     return Result.failure('Erro ao conectar com o servidor: $error');
  //   }
  // }

  Future<Result<void>> signIn(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      return Result.successEmpty();
    } on AuthException catch (error) {
      return Result.failure(error.message);
    } catch (error) {
      return Result.failure('Erro ao conectar com o servidor');
    }
  }
}
