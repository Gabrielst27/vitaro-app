import 'package:firebase_auth/firebase_auth.dart';
import 'package:vitaro_app/data/api/user_api_service.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/domain/models/user_model.dart';

final userApiService = UserApiService();

class FindCurrentUserUsecase {
  static Future<Result<UserModel>> execute() async {
    final auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    if (currentUser == null) {
      return Result.failure('Usuário não autenticado');
    }
    final result = await userApiService.findCurrentUser();
    if (!result.isSuccess) {
      return Result.failure(result.errorMessage);
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
    return Result.success(model);
  }
}
