import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'share_plugin_method_channel.dart';

abstract class SharePluginPlatform extends PlatformInterface {
  SharePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static SharePluginPlatform _instance = MethodChannelSharePlugin();

  static SharePluginPlatform get instance => _instance;

  static set instance(SharePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> shareMethod(String message) async {
    throw UnimplementedError('shareMethod() has not been implemented.');
  }
}
