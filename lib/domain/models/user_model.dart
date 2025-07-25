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
