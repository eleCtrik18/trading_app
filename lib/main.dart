// @dart=2.9

import 'package:flutter/material.dart';
import 'package:trading_app/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: MyCustomUI(),
    );
  }
}
