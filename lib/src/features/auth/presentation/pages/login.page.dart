import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenlight_web/src/core/core.dart';

import 'package:greenlight_web/src/features/movies/movies.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome back! 😁',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const GreenlightTextInputField(
              labelText: "Email",
            ),
            const GreenlightTextInputField(
              labelText: "Password",
            ),
            const SizedBox(
              height: 32,
            ),
            OutlinedButton(
              onPressed: () {
                GoRouter.of(Utils.rootNavKey.currentContext!)
                    .go(MoviesPage.route);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
