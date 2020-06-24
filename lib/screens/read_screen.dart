import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadScreen extends StatelessWidget {
  String cordelText;
  String cordelName;
  String cordelAutor;
  ReadScreen({this.cordelName, this.cordelText, this.cordelAutor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.cordelName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          
          child: Column(
            children: <Widget>[
              Text(
                cordelText,
                style: TextStyle(fontSize: 20),
              ),
              Text("Autor: ${this.cordelAutor}")
            ],
          ),
        ),
      ),
    );
  }
}