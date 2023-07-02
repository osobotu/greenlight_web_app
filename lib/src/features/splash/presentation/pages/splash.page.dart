import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';

class SplashPage extends StatelessWidget {
  static const String route = '/splash';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to Greenlight!",
              style: TextStyle(color: Palette.black),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Utils.rootNavKey.currentContext!.go(LoginPage.route);
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(
                  width: 16,
                ),
                OutlinedButton(
                  onPressed: () {
                    Utils.rootNavKey.currentContext!.go(RegisterPage.route);
                  },
                  child: const Text('Register'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
