import 'package:vitaro_app/data/api/user_api_service.dart';
import 'package:vitaro_app/domain/models/user_model.dart';

final userApiService = UserApiService();

class UserSignupUsecase {
  static Future<void> execute(UserModel user) async {
    userApiService.signUp(user);
  }
}
