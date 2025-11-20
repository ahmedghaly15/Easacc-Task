import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/primary_button.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 24,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            PrimaryButton(
              onPressed: () {},
              text: AppStrings.googleSignIn,
              backgroundColor: Colors.redAccent,
            ),
            PrimaryButton(onPressed: () {}, text: AppStrings.facebookSignIn),
          ],
        ),
      ),
    );
  }
}
