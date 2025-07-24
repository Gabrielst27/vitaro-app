import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitaro_app/data/api/user_api_service.dart';
import 'package:vitaro_app/domain/models/result_dto.dart';

final userApiService = UserApiService();

class UserSigninUsecase {
  static Future<Result<void>> execute(
    ProviderContainer container,
    String email,
    String password,
  ) async {
    final result = await userApiService.signIn(email, password);
    if (!result.isSuccess) {
      return Result.failure(result.errorMessage);
    }
    return Result.success({});
  }
}
