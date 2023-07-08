import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/auth/data/data.dart';

abstract class IAuthRepository {
  Future<APIResponse<UserResponse>> register(RegisterRequest request);

  Future<APIResponse<UserResponse>> activateAccount(TokenRequest request);

  Future<APIResponse<TokensResponse>> login(LoginRequest request);
}
