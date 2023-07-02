import 'package:flutter/material.dart';
import 'package:greenlight_web/src/core/core.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Utils.homeScaffoldKey,
      body: child,
    );
  }
}
