import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  //quit immediately any time an error is caught by Flutter in release mode
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(EcordelApp());
}

class EcordelApp extends StatelessWidget {
  const EcordelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-cordel',
      theme: ThemeData(
          primarySwatch: Colors.orange, primaryColor: Colors.lightBlue),
      home: HomeScreen(),
    );
  }
}
