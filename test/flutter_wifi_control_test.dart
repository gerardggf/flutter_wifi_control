import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wifi_control/flutter_wifi_control.dart';
import 'package:flutter_wifi_control/flutter_wifi_control_platform_interface.dart';
import 'package:flutter_wifi_control/flutter_wifi_control_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWifiControlPlatform
    with MockPlatformInterfaceMixin
    implements FlutterWifiControlPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterWifiControlPlatform initialPlatform = FlutterWifiControlPlatform.instance;

  test('$MethodChannelFlutterWifiControl is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWifiControl>());
  });

  test('getPlatformVersion', () async {
    FlutterWifiControl flutterWifiControlPlugin = FlutterWifiControl();
    MockFlutterWifiControlPlatform fakePlatform = MockFlutterWifiControlPlatform();
    FlutterWifiControlPlatform.instance = fakePlatform;

    expect(await flutterWifiControlPlugin.getPlatformVersion(), '42');
  });
}
