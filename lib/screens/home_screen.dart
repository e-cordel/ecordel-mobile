import 'package:ecordel/repositores/ecordel_repository.dart';

import '../models/cordel_summary.dart';
import 'package:ecordel/widgets/ecordel_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {

  final String routeName = '/home-screen';
  final api = EcordelRepositoryAPI();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('e-cordel'),
      ),
      body: FutureBuilder<List<CordelSummary>>(
        future: api.getSummaries(),
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.hasData) {
            return buildGridView(snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Houve um erro ao obter os cordeis"),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Image.asset('assets/images/ecordel.png')),
            ListTile(
              leading: Icon(Icons.web),
              title: Text('Sobre'),
              onTap: () => launch('https://www.ecordel.com.br'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildGridView(List<CordelSummary> cordels) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: cordels.length,
      itemBuilder: (ctx, index) => EcordelCard(cordel: cordels[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 10,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
