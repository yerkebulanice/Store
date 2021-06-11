import 'package:flutter/material.dart';
import 'widgets/ads_smartapp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdsSmartApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
