import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../loggers/debug_logger.dart';

final sharedPrefProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(); // will be overridden in main
});

final sharedPrefHelperProvider = Provider<SharedPrefHelper>((ref) {
  throw UnimplementedError(); // will be overridden in main
});

abstract class CacheHelper {
  Future<bool> setData(String key, value);
  Future<bool> removeData(String key);
  Future<bool> clearAllData();
  bool? getBool(String key);
  int? getInt(String key);
  double? getDouble(String key);
  String? getString(String key);
}

class SharedPrefHelper implements CacheHelper {
  final SharedPreferences _sharedPref;

  SharedPrefHelper(this._sharedPref);

  /// Removes a value from SharedPreferences with given [key].
  @override
  Future<bool> removeData(String key) {
    DebugLogger.log('SharedPrefHelper : data with key : $key has been removed');
    return _sharedPref.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  @override
  Future<bool> clearAllData() {
    DebugLogger.log('SharedPrefHelper : all data has been cleared');
    return _sharedPref.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  @override
  Future<bool> setData(String key, value) async {
    DebugLogger.log(
      "SharedPrefHelper : setData with key : $key and value : $value",
    );
    switch (value.runtimeType) {
      case const (String):
        return _sharedPref.setString(key, value);
      case const (int):
        return _sharedPref.setInt(key, value);
      case const (bool):
        return _sharedPref.setBool(key, value);
      case const (double):
        return _sharedPref.setDouble(key, value);
      default:
        return false;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  @override
  bool? getBool(String key) {
    DebugLogger.log('SharedPrefHelper : getBool with key : $key');
    return _sharedPref.getBool(key);
  }

  /// Gets a double value from SharedPreferences with given [key].
  @override
  double? getDouble(String key) {
    DebugLogger.log('SharedPrefHelper : getDouble with key : $key');
    return _sharedPref.getDouble(key);
  }

  /// Gets an int value from SharedPreferences with given [key].
  @override
  int? getInt(String key) {
    DebugLogger.log('SharedPrefHelper : getInt with key : $key');
    return _sharedPref.getInt(key);
  }

  /// Gets an String value from SharedPreferences with given [key].
  @override
  String? getString(String key) {
    DebugLogger.log('SharedPrefHelper : getString with key : $key');
    return _sharedPref.getString(key);
  }
}
