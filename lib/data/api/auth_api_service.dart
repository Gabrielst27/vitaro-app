import 'package:firebase_auth/firebase_auth.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';

class AuthApiService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Result<void>> signIn(
    String email,
    String password,
  ) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credentials.user == null) {
        return Result.failure('Usuário está desativado');
      }
      return Result.successEmpty();
    } on FirebaseAuthException catch (error) {
      final errorMessage = _firebaseAuthErrorMessage(error.code);
      return Result.failure(errorMessage);
    } catch (error) {
      return Result.failure('Erro ao conectar com o servidor: $error');
    }
  }

  String _firebaseAuthErrorMessage(String code) {
    switch (code) {
      case 'invalid-credential':
        return 'Email ou senha incorretos';
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
