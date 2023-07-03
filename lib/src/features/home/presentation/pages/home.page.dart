import 'package:flutter/material.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/navigation/navigation.dart';

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
      body: Row(
        children: [
          const LeftNavigationView(),
          const VerticalDivider(
            thickness: 1,
            width: 0,
            color: Palette.black,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
