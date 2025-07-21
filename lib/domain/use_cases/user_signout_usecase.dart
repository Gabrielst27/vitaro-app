import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitaro_app/domain/providers/current_user_provider.dart';

class UserSignoutUsecase {
  static Future<void> execute(ProviderContainer container) async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'access_token');
    container.read(currentUserProvider.notifier).logout();
  }
}
