import 'package:flutter/material.dart';

class DeviceType {
  static final DeviceType _singleton = DeviceType._internal();

  factory DeviceType() {
    return _singleton;
  }

  DeviceType._internal();

  String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }
}
