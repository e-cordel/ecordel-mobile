import 'package:ecordel/app/app_widget.dart';
import 'package:ecordel/providers/cordeis_provider.dart';
import 'package:ecordel/screens/read_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecordel/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import './screens/read_screen.dart';

// void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));
void main() => runApp(EcordelApp());

class EcordelApp extends StatelessWidget {
  const EcordelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EcordelProvider>(
          create: (_) => EcordelProvider(),
        )
      ],
      child: MaterialApp(
        title: 'E-Cordel',
        theme:
            ThemeData(primarySwatch: Colors.orange, primaryColor: Colors.black),
        home: HomeScreen(),
        routes: {
          ReadScreen.routeName: (ctx) => ReadScreen(
                cordelId: 1,
              ),
        },
      ),
    );
  }
}
