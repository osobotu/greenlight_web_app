import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';

class RegisterPage extends ConsumerWidget {
  static const String route = '/register';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(registerViewModelProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();

    ref.listen(registerViewModelProvider, (previous, next) {
      if (next == RegisterState.success) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful')));
        GoRouter.of(Utils.rootNavKey.currentContext!).go(ActivationPage.route);
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Get started! 😁",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GreenlightTextInputField(
              labelText: "Name",
              controller: nameController,
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
                ref.read(registerViewModelProvider.notifier).register(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text);
              },
              child: vm == RegisterState.loading
                  ? const LoadingIndicator()
                  : const Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
