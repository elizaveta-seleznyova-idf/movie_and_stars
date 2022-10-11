import 'share_plugin_platform_interface.dart';

class SharePlugin {

  static Future<void> shareMethod(String message) async {
    return SharePluginPlatform.instance.shareMethod(message);
  }

}
