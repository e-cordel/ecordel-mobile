import 'app/commons/providers/cordel_provider.dart';
import 'app/screens/home/home_page.dart';
import 'app/screens/read/read_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EcordelProvider(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        ReadScreen.route: (context) => ReadScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'E-Cordel',
    );
  }
}
