package com.example.flutter_wifi_control

import androidx.annotation.NonNull

import android.Manifest
import android.content.pm.PackageManager
import androidx.core.content.ContextCompat

import android.net.wifi.WifiManager
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.content.Context

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterWifiControlPlugin */
class FlutterWifiControlPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var applicationContext: Context 

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_wifi_control")
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getSSID") {
      if (!hasPermissions()) {
        result.error("PERMISSION_DENIED", "Ubicación no permitida", null)
        return
      }
      val ssid= getSSID()
      result.success(ssid)
    } else {
      result.notImplemented()
    }
  }

  private fun hasPermissions(): Boolean {
    return ContextCompat.checkSelfPermission(applicationContext, Manifest.permission.ACCESS_FINE_LOCATION) == PackageManager.PERMISSION_GRANTED
  }

  private fun getSSID(): String? {
    val connectivityManager = applicationContext.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
    val network = connectivityManager.activeNetwork ?: return null
    val capabilities = connectivityManager.getNetworkCapabilities(network) ?: return null

    if (capabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)) {
        val wifiManager = applicationContext.applicationContext.getSystemService(Context.WIFI_SERVICE) as WifiManager
        val connectionInfo = wifiManager.connectionInfo
        return connectionInfo.ssid.removeSurrounding("\"")
    }
    return null
}


  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
