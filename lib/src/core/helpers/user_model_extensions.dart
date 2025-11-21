import 'package:easacc_first_task/src/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/data/models/user_model.dart';
import '../cache/secure_cache.dart';
import '../routing/routes.dart';
import 'secure_cache_extension.dart';

typedef AuthSuccessHandler = Future<void> Function(Ref, BuildContext);

extension AuthSuccessHandlerExtension on UserModel {
  AuthSuccessHandler get handleLoginSuccess => (ref, context) async {
    final secureStorage = ref.read(secureStorageHelperProvider);
    secureStorage.secureUser(this);
    context.pushReplacementNamed(Routes.home);
  };
}
