import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/theming/app_themes.dart';
import 'core/utils/app_strings.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
