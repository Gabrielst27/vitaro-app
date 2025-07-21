import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSignoutUsecase {
  static Future<void> execute() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'access_token');
  }
}
