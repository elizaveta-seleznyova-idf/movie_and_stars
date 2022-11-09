import 'package:flutter_test/flutter_test.dart';
import 'package:share_plugin/share_plugin_platform_interface.dart';
import 'package:share_plugin/share_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSharePluginPlatform
    with MockPlatformInterfaceMixin
    implements SharePluginPlatform {
  @override
  Future<void> shareMethod(String message, String name) {
    // TODO: implement shareMethod
    throw UnimplementedError();
  }
  
}

void main() {
  final SharePluginPlatform initialPlatform = SharePluginPlatform.instance;

  test('$MethodChannelSharePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSharePlugin>());
  });
  
}
