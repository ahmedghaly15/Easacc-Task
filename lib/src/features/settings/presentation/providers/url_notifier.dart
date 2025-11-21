import 'package:flutter_riverpod/flutter_riverpod.dart';

class UrlNotifier extends Notifier<String> {
  @override
  String build() => '';

  void onChange(String value) => state = value;
}

final urlProvider = NotifierProvider.autoDispose<UrlNotifier, String>(
  UrlNotifier.new,
);
