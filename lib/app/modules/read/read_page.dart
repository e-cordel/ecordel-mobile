import 'package:ecordel/app/share/models/ecordel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'read_controller.dart';

class ReadPage extends StatefulWidget {
  final String title;
  final int cordelId;
  const ReadPage({Key key, this.title = "", this.cordelId}) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends ModularState<ReadPage, ReadController> {
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
                  onPressed: controller.addFontScale,
                ),
                IconButton(
                  iconSize: 20,
                  icon: Icon(Icons.remove),
                  onPressed: controller.subFontScale,
                )
              ],
            ),
          ],
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.fetchCordelById(widget.cordelId),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Um erro ocorreu ao abrir este cordel'),
                );
              } else if (snapshot.hasData) {
                return buildContent(snapshot.data);
              }
              return Center(
                child: Text('Um erro desconhecido ocorreu'),
              );
            }));
  }

  SingleChildScrollView buildContent(Ecordel cordel) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: 260,
              width: 200,
              child: getImage( cordel ),
            ),
            Observer(builder: (_) {
              return Text(
                cordel.content,
                style: TextStyle(fontSize: 20 * controller.fontScaleFactor),
              );
            }),
            Text("Autor: ${cordel.author.name}")
          ],
        ),
      ),
    );
  }

  Widget getImage( Ecordel cordel ) {
    String imageUrl = "https://ecordel.com.br/wp-content/uploads/2020/07/ebook.png";
    if (cordel.xilogravura != null && cordel.xilogravura.url != null) {
      imageUrl = cordel.xilogravura.url;
    }
    return Image.network( imageUrl, fit: BoxFit.contain );
  }

  Center buildProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
