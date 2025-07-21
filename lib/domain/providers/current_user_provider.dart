import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vitaro_app/domain/models/user_model.dart';

class CurrentUserNotifier extends StateNotifier<UserModel> {
  CurrentUserNotifier() : super(UserModel(name: '', email: ''));

  void login(UserModel user) {
    state = user;
  }

  void logout() {
    state = UserModel(name: '', email: '');
  }
}

final currentUserProvider =
    StateNotifierProvider<CurrentUserNotifier, UserModel>((ref) {
      return CurrentUserNotifier();
    });
