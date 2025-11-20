import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/supabase/supabase_request_result.dart';
import '../../data/repos/auth_repo.dart';

class FacebookSignInAsyncNotifier extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() => false;

  void login() async {
    state = const AsyncLoading();
    final result = await ref.read(authRepoProvider).facebookSingIn();
    result.when(
      success: (isLoggedIn) => state = AsyncValue.data(isLoggedIn),
      failure: (error) =>
          state = AsyncValue.error(error.toString(), StackTrace.current),
    );
  }
}

final facebookSignInProvider =
    AsyncNotifierProvider.autoDispose<FacebookSignInAsyncNotifier, bool>(
      FacebookSignInAsyncNotifier.new,
    );
