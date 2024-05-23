import 'package:ecordel/main.dart';
import 'package:ecordel/models/cordel_summary.dart';
import 'package:ecordel/utils/images.dart';

import '../models/ecordel.dart';
import 'package:flutter/material.dart';

final defaultPadding = 15.0;
final headerSize = 20.0;

class ReadScreen extends StatefulWidget {
  final CordelSummary summary;

  ReadScreen({Key? key, required this.summary}) : super(key: key);

  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  var textSize = 18.0;
  Cordel? cordel;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        textSize++;
      } else {
        textSize--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.summary.title,
          style: TextStyle(fontSize: headerSize),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(child: buildContent()),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: "Aumentar texto"),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove), label: "Diminuir texto"),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  SingleChildScrollView buildContent() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: defaultPadding, bottom: defaultPadding),
                child: getXilogravuraImageOrDefault(
                    widget.summary.xilogravuraUrl, BoxFit.contain)),
            Text(
              "Autor: ${widget.summary.authorName}",
              style: TextStyle(fontSize: headerSize),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: FutureBuilder(
                  future: getCordel(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting &&
                        this.cordel == null) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Um erro ocorreu ao abrir este cordel'),
                      );
                    } else if (snapshot.hasData || this.cordel != null) {
                      return buildTextContent(
                          this.cordel ?? snapshot.data as Cordel);
                    }
                    return Center(
                      child: Text('Um erro desconhecido ocorreu'),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Center buildProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<Cordel> getCordel() async {
    if (cordel == null) {
      return EcordelApp.of(context)
          .api
          .getById(widget.summary.id)
          .then((value) => cordel = value);
    }
    return Future.value(cordel);
  }

  Text buildTextContent(Cordel cordel) {
    return Text(
      cordel.content ?? "",
      style: TextStyle(fontSize: textSize),
    );
  }
}
