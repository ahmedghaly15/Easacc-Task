import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanned_device.freezed.dart';

@freezed
sealed class ScannedDevice with _$ScannedDevice {
  const factory ScannedDevice({required String name, required String address}) =
      _ScannedDevice;
}
