import 'package:vitaro_app/data/api/dtos/authenticated_user_dto.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String? password;
  final double? age;
  final double? height;
  final double? weight;
  final String? token;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.password,
    this.age,
    this.height,
    this.weight,
    this.token,
  });
}

class UserModelMapper {
  static UserModel toModel(AuthenticatedUserDto authenticatedUser) {
    return UserModel(
      id: authenticatedUser.id,
      name: authenticatedUser.name,
      email: authenticatedUser.email,
    );
  }
}
