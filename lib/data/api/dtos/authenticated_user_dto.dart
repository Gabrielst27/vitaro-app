class AuthenticatedUserDto {
  final String id;
  final String name;
  final String email;
  final double? age;
  final double? height;
  final double? weight;
  final String token;

  AuthenticatedUserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.height,
    required this.weight,
    required this.token,
  });
}

class AuthenticatedUserMapper {
  static AuthenticatedUserDto toDto(Map<String, dynamic> data) {
    return AuthenticatedUserDto(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      age: _toNullableDouble(data['age']),
      height: _toNullableDouble(data['height']),
      weight: _toNullableDouble(data['weight']),
      token: data['token'],
    );
  }

  static double? _toNullableDouble(dynamic value) {
    if (value == null) return null;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) return double.tryParse(value);
    return null;
  }
}
