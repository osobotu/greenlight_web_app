import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';

class ActivationPage extends ConsumerWidget {
  static const String route = '/confirm-email';
  const ActivationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(activationViewModelProvider);
    final tokenController = TextEditingController();

    ref.listen(activationViewModelProvider, (previous, next) {
      if (next == ActivationState.success) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Your account has been activated.')));
        GoRouter.of(Utils.rootNavKey.currentContext!).go(LoginPage.route);
      }
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'An activation token has been sent to your email. 📲 \nCopy and paste it here to verify your account! 😀',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GreenlightTextInputField(
              labelText: "Activation Token",
              controller: tokenController,
            ),
            const SizedBox(
              height: 32,
            ),
            OutlinedButton(
              onPressed: () {
                ref
                    .read(activationViewModelProvider.notifier)
                    .activateAccount(token: tokenController.text);
              },
              child: vm == ActivationState.loading
                  ? const LoadingIndicator()
                  : const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
