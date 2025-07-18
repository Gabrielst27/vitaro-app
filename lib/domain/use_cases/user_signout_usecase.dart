import 'package:shared_preferences/shared_preferences.dart';

class UserSignoutUsecase {
  static Future<void> execute() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('access_token');
  }
}
