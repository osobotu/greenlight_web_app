import 'dart:convert';

class TokensResponse {
  final String token;
  final DateTime expiry;

  TokensResponse({required this.token, required this.expiry});

  factory TokensResponse.fromMap(Map<String, dynamic> map) {
    final authData = map['authentication_token'];
    return TokensResponse(
      token: authData['token'] as String,
      expiry: DateTime.parse(authData['expiry']),
    );
  }

  factory TokensResponse.fromJson(String source) =>
      TokensResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class TokenRequest {
  final String token;

  TokenRequest({required this.token});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
    };
  }

  String toJson() => json.encode(toMap());
}
