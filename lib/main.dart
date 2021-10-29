import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() => runApp(EcordelApp());

class EcordelApp extends StatelessWidget {
  const EcordelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-cordel',
      theme:
          ThemeData(primarySwatch: Colors.orange, primaryColor: Colors.lightBlue),
      home: HomeScreen(),
    );
  }
}
