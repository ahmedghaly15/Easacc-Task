import 'package:easacc_first_task/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/url_notifier.dart';

class OpenWebViewButtonConsumer extends ConsumerWidget {
  const OpenWebViewButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = ref.watch(urlProvider);
    return PrimaryButton(
      onPressed: url.isEmpty
          ? null
          : () => context.pushNamed(Routes.webView, arguments: url),
      text: AppStrings.openWebView,
    );
  }
}
