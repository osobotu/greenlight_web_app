import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';

class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel(this.authRepository) : super(RegisterState.idle);
  final IAuthRepository authRepository;

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    state = RegisterState.loading;
    final result = await authRepository.register(
        RegisterRequest(email: email, password: password, name: name));
    if (result.error != null) {
      state = RegisterState.error;
      return;
    }

    state = RegisterState.success;
    return;
  }
}

enum RegisterState {
  idle,
  loading,
  success,
  error,
}
