import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_wifi_control/flutter_wifi_control.dart';
import 'package:flutter_wifi_control/flutter_wifi_control_platform_interface.dart';
import 'package:flutter_wifi_control/flutter_wifi_control_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWifiControlPlatform
    with MockPlatformInterfaceMixin
    implements FlutterWifiControlPlatform {
  @override
  Future<String?> getSSID() => Future.value('fakeSSID');
}

void main() {
  final FlutterWifiControlPlatform initialPlatform =
      FlutterWifiControlPlatform.instance;

  test('$MethodChannelFlutterWifiControl is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWifiControl>());
  });

  test('getPlatformVersion', () async {
    MockFlutterWifiControlPlatform fakePlatform =
        MockFlutterWifiControlPlatform();
    FlutterWifiControlPlatform.instance = fakePlatform;

    expect(await FlutterWifiControl.getSSID(), 'fakeSSIDD');
  });
}
