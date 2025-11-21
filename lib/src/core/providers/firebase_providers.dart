import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider.autoDispose<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);
