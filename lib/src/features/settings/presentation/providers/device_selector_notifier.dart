import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/scanned_device.dart';

class DeviceSelectorNotifier extends Notifier<ScannedDevice> {
  final ScannedDevice selectedDevice;

  DeviceSelectorNotifier(this.selectedDevice);

  @override
  ScannedDevice build() => selectedDevice;

  void select(ScannedDevice? device) {
    state = device ?? state;
  }
}

final deviceSelectorProvider = NotifierProvider.autoDispose
    .family<DeviceSelectorNotifier, ScannedDevice, ScannedDevice>(
      DeviceSelectorNotifier.new,
    );
