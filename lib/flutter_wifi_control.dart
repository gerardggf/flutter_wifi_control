import 'flutter_wifi_control_platform_interface.dart';

class FlutterWifiControl {
  /// Returns the SSID of the connected wifi in case of a wifi connection, null otherwise
  static Future<String?> getSSID() async {
    return await FlutterWifiControlPlatform.instance.getSSID();
  }
}
