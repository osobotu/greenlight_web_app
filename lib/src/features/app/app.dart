import 'package:flutter/material.dart';
import 'package:greenlight_web/src/core/core.dart';

class GreenlightApp extends StatelessWidget {
  const GreenlightApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Greenlight',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'UbuntuMono'),
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
