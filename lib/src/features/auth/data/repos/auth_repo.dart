import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/social_media_auth_service.dart';
import '../../../../core/firebase/firebase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../models/user_model.dart';

final authRepoProvider = Provider.autoDispose<AuthRepo>(
  (ref) => AuthRepoImpl(ref.read(socialMediaAuthServiceProvider)),
);

abstract class AuthRepo {
  Future<FirebaseRequestResult<UserModel>> googleSingIn();
  Future<FirebaseRequestResult<UserModel>> facebookSingIn();
}

class AuthRepoImpl implements AuthRepo {
  final SocialMediaAuthService _socialAuthService;

  AuthRepoImpl(this._socialAuthService);

  @override
  Future<FirebaseRequestResult<UserModel>> facebookSingIn() {
    return executeAndHandleErrors<UserModel>(
      () => _socialAuthService.facebookSignIn(),
    );
  }

  @override
  Future<FirebaseRequestResult<UserModel>> googleSingIn() {
    return executeAndHandleErrors<UserModel>(
      () => _socialAuthService.googleSignIn(),
    );
  }
}
