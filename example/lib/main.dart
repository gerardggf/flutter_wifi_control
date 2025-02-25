import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_wifi_control/flutter_wifi_control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? ssid;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    ssid = await FlutterWifiControl.getSSID();
    print(ssid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter wifi control'),
        ),
        body: Center(
          child: Text(ssid ?? '-'),
        ),
      ),
    );
  }
}
