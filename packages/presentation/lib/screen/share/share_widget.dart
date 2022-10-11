import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SharePlugin extends StatefulWidget {
  const SharePlugin({super.key});

  @override
  State<SharePlugin> createState() => _SharePluginState();
}

class _SharePluginState extends State<SharePlugin> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
