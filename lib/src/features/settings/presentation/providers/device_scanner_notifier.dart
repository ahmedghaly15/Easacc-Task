import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../data/models/scanned_device.dart';

final bluProvider = Provider.autoDispose<FlutterBluetoothSerial>(
  (ref) => FlutterBluetoothSerial.instance,
);

final networkInfoProvider = Provider.autoDispose<NetworkInfo>(
  (ref) => NetworkInfo(),
);

class DeviceScannerNotifier extends AsyncNotifier<List<ScannedDevice>> {
  @override
  FutureOr<List<ScannedDevice>> build() => [];

  Future<void> scanDevices() async {
    state = const AsyncValue.loading();
    try {
      // 1. Check Bluetooth permissions
      final btPerm = await Permission.bluetoothScan.request();
      final locPerm = await Permission.locationWhenInUse.request();

      if (!btPerm.isGranted || !locPerm.isGranted) {
        state = AsyncValue.error(
          'Bluetooth or Location permission denied.',
          StackTrace.current,
        );
        return;
      }

      // 2. Check Bluetooth status
      final btState = await ref.read(bluProvider).state;
      if (btState != BluetoothState.STATE_ON) {
        state = AsyncValue.error(
          'Bluetooth is OFF. Please turn it ON.',
          StackTrace.current,
        );
        return;
      }

      // 3. Check WiFi connection
      final wifiName = await ref.read(networkInfoProvider).getWifiName();
      final isWifiConnected = wifiName != null && wifiName.isNotEmpty;

      // 4. Scan Bluetooth devices
      final btDevices = await ref.read(bluProvider).getBondedDevices();

      final btList = btDevices
          .map(
            (d) => ScannedDevice(name: d.name ?? "Unknown", address: d.address),
          )
          .toList();

      // Add WiFi as a device
      final wifiDevice = isWifiConnected
          ? [ScannedDevice(name: wifiName, address: "WiFi")]
          : [];

      state = AsyncValue.data([...wifiDevice, ...btList]);
    } catch (e) {
      state = AsyncValue.error(e.toString, StackTrace.current);
    }
  }
}

final deviceScannerProvider =
    AsyncNotifierProvider.autoDispose<
      DeviceScannerNotifier,
      List<ScannedDevice>
    >(DeviceScannerNotifier.new);
