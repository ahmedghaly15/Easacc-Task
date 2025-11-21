import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/device_scanner_notifier.dart';
import 'widgets/open_web_view_button_consumer.dart';
import 'widgets/scanned_devices_dropdown_button_consumer.dart';
import 'widgets/url_text_field.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const .all(16),
        child: Column(
          spacing: 16,
          children: [
            const UrlTextField(),
            PrimaryButton(
              onPressed: () =>
                  ref.read(deviceScannerProvider.notifier).scanDevices(),
              text: AppStrings.scanNetworkDevices,
            ),
            const ScannedDevicesDropdownButtonConsumer(),
            const Spacer(),
            const OpenWebViewButtonConsumer(),
          ],
        ),
      ),
    );
  }
}
