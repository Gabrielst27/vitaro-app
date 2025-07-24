import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitaro_app/data/api/user_api_service.dart';
import 'package:vitaro_app/domain/models/user_model.dart';
import 'package:vitaro_app/domain/providers/current_user_provider.dart';
import 'package:vitaro_app/domain/use_cases/user_signout_usecase.dart';

final userApiService = UserApiService();

class FindCurrentUserUsecase {
  static Future<void> execute(ProviderContainer container) async {
    final auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    if (currentUser == null) {
      UserSignoutUsecase.execute(container);
    }
    final result = await userApiService.findCurrentUser();
    if (!result.isSuccess) {
      return await UserSignoutUsecase.execute(container);
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
    container.read(currentUserProvider.notifier).login(model);
  }
}
