import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/adaptive_circular_progress_indicator.dart';
import '../../../data/models/scanned_device.dart';
import '../../providers/device_scanner_notifier.dart';
import '../../providers/device_selector_notifier.dart';

class ScannedDevicesDropdownButtonConsumer extends ConsumerWidget {
  const ScannedDevicesDropdownButtonConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncScannedDevices = ref.watch(deviceScannerProvider);
    return asyncScannedDevices.when(
      loading: () => const Center(
        child: AdaptiveCircularProgressIndicator(color: AppColors.primary),
      ),
      data: (scannedDevices) {
        final selectedDevice = ref.watch(
          deviceSelectorProvider(scannedDevices.first),
        );
        return DropdownButtonFormField<ScannedDevice>(
          initialValue: selectedDevice,
          hint: const Text("Select Network Device (WiFi/Bluetooth)"),
          items: scannedDevices
              .map((d) => DropdownMenuItem(value: d, child: Text(d.name)))
              .toList(),
          onChanged: (device) => ref
              .read(deviceSelectorProvider(selectedDevice).notifier)
              .select(device),
          decoration: const InputDecoration(border: OutlineInputBorder()),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text('Error: $error', style: const TextStyle(color: Colors.red)),
      ),
    );
  }
}
