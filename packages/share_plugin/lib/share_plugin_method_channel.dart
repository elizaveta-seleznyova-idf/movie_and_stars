import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'share_plugin_platform_interface.dart';


class MethodChannelSharePlugin extends SharePluginPlatform {

  @visibleForTesting
  final methodChannel = const MethodChannel('share_plugin');


  @override
  Future<void> shareMethod(String message) async {
    try {
      await methodChannel.invokeMethod(
        'shareMethod',
        {'message': message},
      );
    } catch (e) {
      print('ShareMethod didnt work');
    }
  }
}
