import Flutter
import UIKit
import SystemConfiguration.CaptiveNetwork

public class FlutterWifiControlPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_wifi_control", binaryMessenger: registrar.messenger())
    let instance = FlutterWifiControlPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getSSID":
      result(getSSID())
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func getSSID() -> String? {
        if let interfaces = CNCopySupportedInterfaces() as? [String] {
            for interface in interfaces {
                if let info = CNCopyCurrentNetworkInfo(interface as CFString) as NSDictionary? {
                    return info["SSID"] as? String
                }
            }
        }
        return nil
    }
}
