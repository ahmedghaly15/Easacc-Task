import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

/// Custom logger instance with pretty output.
final Logger _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0, // Hide method calls in logs
    colors: true, // Enable colors
    printEmojis: true, // Enable emojis
  ),
);

/// Observes Riverpod providers and logs their lifecycle.
final class RiverpodObserver extends ProviderObserver {
  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    if (!kReleaseMode) {
      _logger.i('🎉 Provider Added: ${_getProviderName(context)} → $value');
    }
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    if (!kReleaseMode) {
      _logger.e('🚫 Provider Removed: ${_getProviderName(context)}');
    }
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    if (!kReleaseMode) {
      _logger.d(
        '🔄 Provider Updated: ${_getProviderName(context)} → $newValue',
      );
    }
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    if (!kReleaseMode) {
      _logger.e('❌ Provider Failed: ${_getProviderName(context)} → $error');
    }
  }

  /// Gets a human-readable provider name.
  String _getProviderName(ProviderObserverContext context) {
    return context.provider.name ?? context.provider.runtimeType.toString();
  }
}
