import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'read_controller.dart';

class ReadPage extends StatefulWidget {
  final String title;
  final int cordelId;
  const ReadPage({Key key, this.title = "Leitura", this.cordelId})
      : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends ModularState<ReadPage, ReadController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.cordelId.toString()),
      ),
    );
  }
}
