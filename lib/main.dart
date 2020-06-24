import 'package:ecordel/providers/cordel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/cordel_overview_screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EcordelProvider(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CordelOverviewScreen(),
    );
  }
}
