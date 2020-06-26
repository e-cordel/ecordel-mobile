import 'package:ecordel/providers/cordel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(              
            ).copyWith(
              headline6: TextStyle(fontSize: 25, fontFamily: GoogleFonts.pangolin().fontFamily, color: Colors.black)
            )
            
          ),
          brightness: Brightness.light,
          primarySwatch: Colors.amber,
          backgroundColor: Colors.amber[100],
          accentColor: Colors.amberAccent[700],
          fontFamily: GoogleFonts.pangolin().fontFamily,
          textTheme: TextTheme()),
      home: CordelOverviewScreen(),
    );
  }
}
