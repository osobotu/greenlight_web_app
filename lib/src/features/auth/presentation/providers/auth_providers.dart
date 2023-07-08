import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) {
    final apiService = ref.read(apiServiceProvider);
    return AuthRepository(apiService);
  },
);

final registerViewModelProvider =
    StateNotifierProvider<RegisterViewModel, RegisterState>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);
    return RegisterViewModel(authRepository);
  },
);

final activationViewModelProvider =
    StateNotifierProvider<ActivationViewModel, ActivationState>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);
    return ActivationViewModel(authRepository);
  },
);

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);
    return LoginViewModel(authRepository);
  },
);
