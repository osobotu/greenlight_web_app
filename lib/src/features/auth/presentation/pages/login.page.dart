import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';

import 'package:greenlight_web/src/features/movies/movies.dart';

class LoginPage extends ConsumerWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginViewModelProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    ref.listen(loginViewModelProvider, (previous, next) {
      if (next == LoginState.success) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Login successful')));
        GoRouter.of(Utils.rootNavKey.currentContext!).go(MoviesPage.route);
      }
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome! 😁',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GreenlightTextInputField(
              labelText: "Email",
              controller: emailController,
            ),
            GreenlightTextInputField(
              labelText: "Password",
              controller: passwordController,
            ),
            const SizedBox(
              height: 32,
            ),
            OutlinedButton(
              onPressed: () {
                ref.read(loginViewModelProvider.notifier).login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              },
              child: vm == LoginState.loading
                  ? const LoadingIndicator()
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
