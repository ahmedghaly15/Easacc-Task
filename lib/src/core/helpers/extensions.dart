import 'package:flutter/material.dart';

import '../theming/app_text_styles.dart';

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this == '';
}

extension ShowMyToast on BuildContext {
  void showToast(String message) => ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      backgroundColor: Colors.black54,
      elevation: 0,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.startToEnd,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      content: Expanded(
        child: Text(
          message,
          style: AppTextStyles.font14Medium.copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}

extension NavigationExtensions on BuildContext {
  void pushNamed(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void pop([dynamic result]) {
    Navigator.pop(this, result);
  }

  void popUntil(String routeName) {
    Navigator.popUntil(this, ModalRoute.withName(routeName));
  }

  void popAndPushNamed(String routeName) {
    Navigator.popAndPushNamed(this, routeName);
  }

  void pushNamedAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  void popTop() => Navigator.of(this, rootNavigator: true).pop();
}
