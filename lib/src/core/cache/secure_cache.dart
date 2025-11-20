import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../loggers/debug_logger.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  throw UnimplementedError(); // will be overridden in main
});

final secureStorageHelperProvider = Provider<SecureStorageHelper>((ref) {
  throw UnimplementedError(); // will be overridden in main
});

abstract class SecureCache {
  Future<void> setSecuredString(String key, String value);
  Future<String?> getSecuredString(String key);
  Future<void> removeSecuredData(String key);
  Future<void> clearAllSecuredData();
}

class SecureStorageHelper implements SecureCache {
  final FlutterSecureStorage _secureStorage;

  SecureStorageHelper(this._secureStorage);

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  @override
  Future<void> setSecuredString(String key, String value) {
    DebugLogger.log(
      "FlutterSecureStorage : setSecuredString with key : $key and value : $value",
    );
    return _secureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  @override
  Future<String?> getSecuredString(String key) {
    DebugLogger.log('FlutterSecureStorage : getSecuredString with $key :');
    return _secureStorage.read(key: key);
  }

  /// Removes a value from FlutterSecureStorage with given [key].
  @override
  Future<void> removeSecuredData(String key) {
    DebugLogger.log(
      'FlutterSecureStorage : data with key : $key has been removed',
    );
    return _secureStorage.delete(key: key);
  }

  /// Removes all keys and values in the FlutterSecureStorage
  @override
  Future<void> clearAllSecuredData() {
    DebugLogger.log('FlutterSecureStorage : all data has been cleared');
    return _secureStorage.deleteAll();
  }
}
