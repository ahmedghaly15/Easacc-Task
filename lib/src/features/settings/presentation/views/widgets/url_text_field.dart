import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/url_notifier.dart';

class UrlTextField extends ConsumerStatefulWidget {
  const UrlTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UrlTextFieldState();
}

class _UrlTextFieldState extends ConsumerState<UrlTextField> {
  late final TextEditingController _urlController;

  @override
  void initState() {
    _urlController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _urlController,
      decoration: const InputDecoration(
        labelText: "Website URL",
        border: OutlineInputBorder(),
      ),
      onChanged: ref.read(urlProvider.notifier).onChange,
    );
  }
}
