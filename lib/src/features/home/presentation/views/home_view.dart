import 'package:easacc_first_task/src/core/helpers/extensions.dart';
import 'package:easacc_first_task/src/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/app_strings.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const .symmetric(horizontal: 24),
        child: Column(
          spacing: 16,
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            PrimaryButton(
              onPressed: () => context.pushNamed(Routes.settings),
              text: AppStrings.settingPage,
            ),
            PrimaryButton(
              onPressed: () => context.pushNamed(Routes.webView),
              text: AppStrings.webView,
            ),
          ],
        ),
      ),
    );
  }
}
