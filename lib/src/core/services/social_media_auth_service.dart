import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/data/models/user_model.dart';
import '../providers/supabase_providers.dart';
import '../supabase/supabase_error_message.dart';

final socailMedialAuthServiceProvider =
    Provider.autoDispose<SocialMediaAuthService>(
      (ref) => SocialMediaAuthServiceImpl(ref.read(supabaseProvider)),
    );

abstract class SocialMediaAuthService {
  Future<UserModel> googleSignIn();
  Future<bool> facebookSignIn();
}

class SocialMediaAuthServiceImpl implements SocialMediaAuthService {
  final SupabaseClient _supabaseClient;

  SocialMediaAuthServiceImpl(this._supabaseClient);

  @override
  Future<UserModel> googleSignIn() async {
    if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
      return await _nativeGoogleSignIn();
    }
    throw 'Current Platform is not Supported';
  }

  Future<UserModel> _nativeGoogleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '39485904573-b7ituag7p10ifv3ibca6f6tbrkr28rcs.apps.googleusercontent.com',
      serverClientId:
          '39485904573-bjlsp267odll3cjl4tldkhhhbdr8qrlc.apps.googleusercontent.com',
    );

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final accessToken = googleAuth?.accessToken;
    final idToken = googleAuth?.idToken;

    if (accessToken == null) {
      throw SupabaseErrorMessage.noAccessTokenFound;
    }
    if (idToken == null) {
      throw SupabaseErrorMessage.noIdTokenFound;
    }

    final authResponse = await _supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return UserModel.fromSession(authResponse.session!);
  }

  @override
  Future<bool> facebookSignIn() {
    return _supabaseClient.auth.signInWithOAuth(
      OAuthProvider.facebook,
      authScreenLaunchMode: LaunchMode.inAppBrowserView,
    );
  }
}
