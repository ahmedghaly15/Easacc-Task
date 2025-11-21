import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/user_model_extensions.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/google_sign_in_async_notifier.dart';

class GoogleSignInButtonConsumer extends ConsumerWidget {
  const GoogleSignInButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncGoogleSignIn = ref.watch(googleSignInProvider);
    final isLoading = asyncGoogleSignIn.isLoading;
    _googleSignInProviderListener(ref, context);
    return PrimaryButton(
      onPressed: isLoading
          ? null
          : () => ref.read(googleSignInProvider.notifier).login(),
      text: AppStrings.googleSignIn,
      backgroundColor: Colors.redAccent,
      child: isLoading
          ? const AdaptiveCircularProgressIndicator()
          : Text(
              AppStrings.googleSignIn,
              style: AppTextStyles.font16SemiBold.copyWith(color: Colors.white),
            ),
    );
  }

  void _googleSignInProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(
      googleSignInProvider,
      (_, current) => current.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data: (user) => user.handleLoginSuccess,
      ),
    );
  }
}
