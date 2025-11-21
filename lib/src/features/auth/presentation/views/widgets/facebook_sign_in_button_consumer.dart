import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/user_model_extensions.dart';
import '../../../../../core/theming/app_text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../providers/facebook_sign_in_async_notifier.dart';

class FacebookSignInButtonConsumer extends ConsumerWidget {
  const FacebookSignInButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFacebookSignIn = ref.watch(facebookSignInProvider);
    final isLoading = asyncFacebookSignIn.isLoading;
    _facebookSignInProviderListener(ref, context);
    return PrimaryButton(
      onPressed: isLoading
          ? null
          : () => ref.read(facebookSignInProvider.notifier).login(),
      text: AppStrings.facebookSignIn,
      child: isLoading
          ? const AdaptiveCircularProgressIndicator()
          : Text(
              AppStrings.facebookSignIn,
              style: AppTextStyles.font16SemiBold.copyWith(color: Colors.white),
            ),
    );
  }

  void _facebookSignInProviderListener(WidgetRef ref, BuildContext context) {
    ref.listen(
      facebookSignInProvider,
      (_, current) => current.whenOrNull(
        error: (error, _) => context.showToast(error.toString()),
        data: (user) => user.handleLoginSuccess,
      ),
    );
  }
}
