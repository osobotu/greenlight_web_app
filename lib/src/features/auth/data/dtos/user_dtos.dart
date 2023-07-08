import 'dart:convert';

class UserResponse {
  final int id;
  final String name;
  final DateTime createdAt;
  final String email;
  final bool activated;

  UserResponse({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.email,
    required this.activated,
  });

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    final user = map['user'];
    return UserResponse(
      id: user['id'] as int,
      name: user['name'] as String,
      createdAt: DateTime.parse(user['created_at']),
      email: user['email'] as String,
      activated: user['activated'] as bool,
    );
  }

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
