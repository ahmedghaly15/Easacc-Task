import '../../cache/secure_cache.dart';
import '../../helpers/secure_cache_extension.dart';

bool isUserLoggedIn = false;

Future<void> checkUserIsLoggedIn(SecureCache secureCache) async {
  final securedUser = await secureCache.getSecuredUser();
  isUserLoggedIn = securedUser != null;
}
