import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';

class AuthRepository implements IAuthRepository {
  final APIService apiService;

  AuthRepository(this.apiService);

  @override
  Future<APIResponse<UserResponse>> activateAccount(
      TokenRequest request) async {
    final response =
        await apiService.putData('/users/activated', request.toJson());

    if (response.statusCode == 200) {
      final userResponse = UserResponse.fromJson(response.body);
      return APIResponse(data: userResponse, error: null);
    }
    return const APIResponse(
      data: null,
      error: HttpFailure(message: "Bad request"),
    );
  }

  @override
  Future<APIResponse<TokensResponse>> login(LoginRequest request) async {
    final response =
        await apiService.postData('/tokens/authentication', request.toJson());

    if (response.statusCode == 201) {
      final tokensResponse = TokensResponse.fromJson(response.body);
      print(tokensResponse.token);
      return APIResponse(data: tokensResponse, error: null);
    }
    return const APIResponse(
      data: null,
      error: HttpFailure(message: "Bad request"),
    );
  }

  @override
  Future<APIResponse<UserResponse>> register(RegisterRequest request) async {
    final response = await apiService.postData('/users', request.toJson());
    if (response.statusCode == 201) {
      final userResponse = UserResponse.fromJson(response.body);
      return APIResponse(data: userResponse, error: null);
    }
    return const APIResponse(
      data: null,
      error: HttpFailure(message: "Bad request"),
    );
  }
}
