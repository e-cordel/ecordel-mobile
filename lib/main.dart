import 'package:ecordel/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:ecordel/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './screens/home.dart';

// void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));
void main() => runApp(EcordelApp());

class EcordelApp extends StatelessWidget {
  const EcordelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Cordel',
      theme:
          ThemeData(primarySwatch: Colors.orange, primaryColor: Colors.black),
      home: HomeScreen(),
    );
  }
}
