import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show ProviderException;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/core/cache/secure_storage_helper.dart';
import 'src/core/cache/shared_pref_helper.dart';
import 'src/core/widgets/flutter_error_details_view.dart';
import 'src/main_app.dart';
import 'src/core/loggers/riverpod_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPref = await SharedPreferences.getInstance();
  final sharedPrefHelper = SharedPrefHelper(sharedPref);

  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  final secureStorageHelper = SecureStorageHelper(secureStorage);

  ErrorWidget.builder = (FlutterErrorDetails details) =>
      FlutterErrorDetailsView(details: details);

  await Supabase.initialize(
    url: 'https://jggbgcummgjbcmeoedgc.supabase.co',
    anonKey: 'sb_publishable_vSU24U2qQHn8-p1TuOO6Iw_r-xXmR2q',
  );

  runApp(
    ProviderScope(
      observers: [RiverpodObserver()],
      overrides: [
        sharedPrefProvider.overrideWithValue(sharedPref),
        sharedPrefHelperProvider.overrideWithValue(sharedPrefHelper),
        secureStorageProvider.overrideWithValue(secureStorage),
        secureStorageHelperProvider.overrideWithValue(secureStorageHelper),
      ],
      retry: (retryCount, error) {
        if (error is ProviderException) return null;
        if (retryCount > 5) return null;

        return Duration(seconds: retryCount * 2);
      },
      child: const MainApp(),
    ),
  );
}
