import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(this.authRepository) : super(LoginState.idle);
  final IAuthRepository authRepository;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = LoginState.loading;
    final result = await authRepository
        .login(LoginRequest(email: email, password: password));
    print(result.data?.token);
    print(result.error);
    if (result.error != null) {
      state = LoginState.error;
      return;
    }

    state = LoginState.success;
    return;
  }
}

enum LoginState {
  idle,
  loading,
  success,
  error,
}
