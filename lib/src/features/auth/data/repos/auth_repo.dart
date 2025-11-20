import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/social_media_auth_service.dart';
import '../../../../core/supabase/supabase_request_result.dart';
import '../../../../core/utils/functions/execute_and_handle_errors.dart';
import '../models/user_model.dart';

final authRepoProvider = Provider.autoDispose<AuthRepo>(
  (ref) => AuthRepoImpl(ref.read(socailMedialAuthServiceProvider)),
);

abstract class AuthRepo {
  Future<SupabaseRequestResult<UserModel>> googleSingIn();
  Future<SupabaseRequestResult<bool>> facebookSingIn();
}

class AuthRepoImpl implements AuthRepo {
  final SocialMediaAuthService _socialAuthService;

  AuthRepoImpl(this._socialAuthService);

  @override
  Future<SupabaseRequestResult<bool>> facebookSingIn() {
    return executeAndHandleErrors<bool>(
      () => _socialAuthService.facebookSignIn(),
    );
  }

  @override
  Future<SupabaseRequestResult<UserModel>> googleSingIn() {
    return executeAndHandleErrors<UserModel>(
      () => _socialAuthService.googleSignIn(),
    );
  }
}
