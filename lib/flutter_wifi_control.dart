import 'flutter_wifi_control_platform_interface.dart';

class FlutterWifiControl {
  Future<String?> getPlatformVersion() {
    return FlutterWifiControlPlatform.instance.getPlatformVersion();
  }
}
