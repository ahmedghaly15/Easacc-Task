import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/auth_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';
import '../../features/web_view/presentation/views/web_view.dart';
import '../utils/functions/check_user_is_logged_in.dart';
import 'routes.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return isUserLoggedIn
            ? MaterialPageRoute(builder: (_) => const HomeView())
            : MaterialPageRoute(builder: (_) => const AuthView());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsView());

      case Routes.webView:
        return MaterialPageRoute(builder: (_) => const WebView());

      default:
        return _notFoundRoute();
    }
  }

  static MaterialPageRoute<dynamic> _notFoundRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text('No route found'))),
    );
  }
}
