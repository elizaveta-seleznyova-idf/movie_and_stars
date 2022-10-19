import 'share_plugin_platform_interface.dart';

class SharePlugin {
  static Future<void> shareMethod(
    String message,
    String name,
  ) async {
    return SharePluginPlatform.instance.shareMethod(
      message,
      name,
    );
  }
}
