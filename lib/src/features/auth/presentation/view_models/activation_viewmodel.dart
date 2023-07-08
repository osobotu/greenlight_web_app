import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';

class ActivationViewModel extends StateNotifier<ActivationState> {
  ActivationViewModel(this.authRepository) : super(ActivationState.idle);

  final IAuthRepository authRepository;

  Future<void> activateAccount({required String token}) async {
    state = ActivationState.loading;
    final result =
        await authRepository.activateAccount(TokenRequest(token: token));

    if (result.error != null) {
      state = ActivationState.error;
      return;
    }

    state = ActivationState.success;
    return;
  }
}

enum ActivationState {
  idle,
  loading,
  success,
  error,
}
