import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/firebase/firebase_request_result.dart';
import '../../data/models/user_model.dart';
import '../../data/repos/auth_repo.dart';

class FacebookSignInAsyncNotifier extends AsyncNotifier<UserModel> {
  @override
  FutureOr<UserModel> build() => UserModel.empty();

  void login() async {
    state = const AsyncLoading();
    final result = await ref.read(authRepoProvider).facebookSingIn();
    result.when(
      success: (user) => state = AsyncValue.data(user),
      failure: (error) =>
          state = AsyncValue.error(error.toString(), StackTrace.current),
    );
  }
}

final facebookSignInProvider =
    AsyncNotifierProvider.autoDispose<FacebookSignInAsyncNotifier, UserModel>(
      FacebookSignInAsyncNotifier.new,
    );
