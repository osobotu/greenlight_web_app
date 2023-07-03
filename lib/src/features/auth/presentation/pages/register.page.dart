import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greenlight_web/src/core/core.dart';

import 'package:greenlight_web/src/features/movies/movies.dart';

class RegisterPage extends StatelessWidget {
  static const String route = '/register';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Get started! 😁",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const GreenlightTextInputField(
              labelText: "Name",
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
              child: const Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
