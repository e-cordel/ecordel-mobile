import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cordel_provider.dart';
import '../models/ecordel.dart';

class ReadScreen extends StatefulWidget {
  int cordelId;
  ReadScreen({this.cordelId});

  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  Ecordel _ecordel;
  bool _isLoading = false;
  bool _firstBuild = true;

  @override
  void didChangeDependencies() {
    if (_firstBuild) {
      setState(() {
        this._isLoading = true;
      });

      Provider.of<EcordelProvider>(context, listen: false)
          .fethById(widget.cordelId)
          .then((cordel) {
            print('CORDEL PUXADO FOI: ${cordel.content}');
        this._ecordel = cordel;
        setState(() {
          this._isLoading = false;
        });
      });
    }

    this._firstBuild = false;
    super.didChangeDependencies();
  }

  // Future<Ecordel> _fethEcordel(BuildContext context) async {
  //   Ecordel fetchEecordel;

  //   var snapshot = await Provider.of<EcordelProvider>(context, listen: false)
  //       .findById(this.widget.cordelId);
  //   return Ecordel(snapshot);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this._isLoading ? Text('') : Text(this._ecordel.tittle) ,
        // title: Text("teste"),
        centerTitle: true,
      ),
      // body: Center(child: Text("testando"),)
      body: this._isLoading
          ? Center(child: CircularProgressIndicator(),)
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text(
                      this._ecordel.content,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("Autor: ${this._ecordel.author}")
                  ],
                ),
              ),
            ),
    );
  }
}
