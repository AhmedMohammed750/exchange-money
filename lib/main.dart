




import 'package:device_preview/device_preview.dart';
import 'package:exchange_money/homescreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) { 
     return  const MaterialApp(
      debugShowCheckedModeBanner: false,

      home:  HomeScreen(),
    );});}
  
}