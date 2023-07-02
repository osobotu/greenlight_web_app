import 'package:go_router/go_router.dart';
import 'package:greenlight_web/src/core/core.dart';
import 'package:greenlight_web/src/features/auth/auth.dart';
import 'package:greenlight_web/src/features/home/home.dart';
import 'package:greenlight_web/src/features/movies/movies.dart';
import 'package:greenlight_web/src/features/splash/splash.dart';

class AppRoutes {
  static final router = GoRouter(
    initialLocation: SplashPage.route,
    navigatorKey: Utils.rootNavKey,
    routes: [
      GoRoute(
        parentNavigatorKey: Utils.rootNavKey,
        path: SplashPage.route,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        parentNavigatorKey: Utils.rootNavKey,
        path: RegisterPage.route,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        parentNavigatorKey: Utils.rootNavKey,
        path: LoginPage.route,
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        navigatorKey: Utils.tabNavKey,
        builder: (context, state, child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
            parentNavigatorKey: Utils.tabNavKey,
            path: MoviesPage.route,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: MoviesPage(),
              );
            },
          )
        ],
      )
    ],
  );
}
