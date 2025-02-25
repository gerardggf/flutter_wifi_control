import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_wifi_control_platform_interface.dart';

/// An implementation of [FlutterWifiControlPlatform] that uses method channels.
class MethodChannelFlutterWifiControl extends FlutterWifiControlPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_wifi_control');

  @override
  Future<String?> getSSID() async {
    try {
      final String? ssid = await methodChannel.invokeMethod<String>('getSSID');
      return ssid;
    } catch (e) {
      return null;
    }
  }
}
