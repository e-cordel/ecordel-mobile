import 'dart:io';

import 'package:ecordel/repositores/ecordel_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  //quit immediately any time an error is caught by Flutter in release mode
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(EcordelApp(
      child: MaterialApp(
        title: 'e-cordel',
        theme: ThemeData(primarySwatch: Colors.green),
        home: HomeScreen(),
      ),
      api: EcordelRepositoryAPI()));
}

class EcordelApp extends InheritedWidget {
  final EcordelRepository api;

  const EcordelApp({
    super.key,
    required this.api,
    required super.child,
  });

  static EcordelApp of(BuildContext context) {
    final EcordelApp? result =
        context.dependOnInheritedWidgetOfExactType<EcordelApp>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(_) => false;
}
