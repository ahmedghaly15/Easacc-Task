import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../features/auth/data/models/user_model.dart';
import '../providers/firebase_providers.dart';

final socialMediaAuthServiceProvider =
    Provider.autoDispose<SocialMediaAuthService>(
      (ref) => SocialMediaAuthServiceImpl(ref.read(firebaseAuthProvider)),
    );

abstract class SocialMediaAuthService {
  Future<UserModel> googleSignIn();
  Future<UserModel> facebookSignIn();
}

class SocialMediaAuthServiceImpl implements SocialMediaAuthService {
  final FirebaseAuth _firebaseAuth;

  SocialMediaAuthServiceImpl(this._firebaseAuth);

  @override
  Future<UserModel> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);

    return UserModel(
      userId: googleUser?.id,
      email: googleUser?.email,
      accessToken: credential.accessToken,
    );
  }

  @override
  Future<UserModel> facebookSignIn() async {
    final loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken?.token == null) {
      throw 'Something wrong happened while signing in with Facebook';
    }

    final facebookAuthCredential = FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );

    final credential = await _firebaseAuth.signInWithCredential(
      facebookAuthCredential,
    );

    return UserModel(
      userId: credential.user?.uid,
      email: credential.user?.email,
      accessToken: credential.credential?.accessToken,
    );
  }
}
