import 'package:ecordel/repositores/ecordel_repository.dart';
import 'package:ecordel/utils/images.dart';

import '../models/ecordel.dart';
import 'package:flutter/material.dart';

class ReadScreen extends StatefulWidget {
  static const String routeName = '/read-screen';

  final String title;
  final int cordelId;

  ReadScreen({Key? key, this.title = "", required this.cordelId})
      : super(key: key);

  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final api = EcordelRepositoryAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Tamanho do texto: ",
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  iconSize: 20,
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 20,
                  icon: Icon(Icons.remove),
                  onPressed: () {},
                )
              ],
            ),
          ],
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
              future: api.getById(widget.cordelId),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Um erro ocorreu ao abrir este cordel'),
                  );
                } else if (snapshot.hasData) {
                  return buildContent(snapshot.data as Ecordel);
                }
                return Center(
                  child: Text('Um erro desconhecido ocorreu'),
                );
              }),
        ));
  }

  SingleChildScrollView buildContent(Ecordel cordel) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
            Text(
            cordel.title,
            style: TextStyle(fontSize: 20),
          ),
          Text("Autor: ${cordel.author.name}"),
          Padding(
              padding: EdgeInsets.only(top: 15),
              child: getXilogravuraImageOrDefault( cordel.xilogravuraUrl, BoxFit.contain)
      ),
      Padding(
        padding: EdgeInsets.only(top: 25),
        child: Text(
          cordel.content ?? "",
          style: TextStyle(fontSize: 14),
        ),
      ),
      ],
    ),)
    ,
    );
  }

  Center buildProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
