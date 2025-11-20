import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/main_app.dart';
import 'src/core/observers/riverpod_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(observers: [RiverpodObserver()], child: const MainApp()),
  );
}
