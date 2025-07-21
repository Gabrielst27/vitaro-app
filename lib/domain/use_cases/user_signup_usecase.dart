import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitaro_app/data/api/user_api_service.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/domain/providers/current_user_provider.dart';

final userApiService = UserApiService();

class UserSignupUsecase {
  static Future<Result<UserModel>> execute(
    ProviderContainer container,
    UserModel user,
  ) async {
    final result = await userApiService.signUp(user);
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
    final storage = FlutterSecureStorage();
    await storage.write(key: 'access_token', value: model.token);
    container.read(currentUserProvider.notifier).login(user);
    return Result.success(model);
  }
}
