import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/auth_view.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AuthView());
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
