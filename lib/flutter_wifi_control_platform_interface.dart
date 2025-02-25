import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_wifi_control_method_channel.dart';

abstract class FlutterWifiControlPlatform extends PlatformInterface {
  FlutterWifiControlPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterWifiControlPlatform _instance =
      MethodChannelFlutterWifiControl();

  static FlutterWifiControlPlatform get instance => _instance;

  static set instance(FlutterWifiControlPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getSSID();
}
