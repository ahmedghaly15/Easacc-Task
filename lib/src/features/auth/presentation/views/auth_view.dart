import 'package:flutter/material.dart';

import 'widgets/facebook_sign_in_button_consumer.dart';
import 'widgets/google_sign_in_button_consumer.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: .symmetric(horizontal: 16),
        child: Column(
          spacing: 24,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            GoogleSignInButtonConsumer(),
            FacebookSignInButtonConsumer(),
          ],
        ),
      ),
    );
  }
}
