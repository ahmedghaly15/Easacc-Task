import 'dart:convert' show jsonEncode, jsonDecode;

import '../../features/auth/data/models/user_model.dart';
import '../cache/secure_cache.dart';
import '../cache/secure_keys.dart';

extension SecureUserModel on SecureCache {
  Future<void> secureUser(UserModel user) {
    final jsonString = jsonEncode(user.toJson());
    return setSecuredString(SecureKeys.user, jsonString);
  }

  Future<UserModel?> getSecuredUser() async {
    final jsonString = await getSecuredString(SecureKeys.user);
    if (jsonString == null) return null;

    final userMap = jsonDecode(jsonString);
    return UserModel.fromJson(userMap);
  }

  Future<void> removeUser() => removeSecuredData(SecureKeys.user);
}
