import 'package:ecordel/controllers/home_controller.dart';

import '../models/cordel_summary_viewmodel.dart';
import 'package:ecordel/models/author.dart';
import 'package:ecordel/widgets/ecordel_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String routeName = '/home-screen';

  final List<Author> autores = [
    Author(id: 0, about: 'desc0', email: 'email1@email', name: 'Name1'),
    Author(id: 1, about: 'desc1', email: 'email1@email', name: 'Name2'),
    Author(id: 2, about: 'desc2', email: 'email1@email', name: 'Name3'),
    Author(id: 2, about: 'desc2', email: 'email1@email', name: 'Name4')
  ];

  final List<CordelSummaryViewModel> cordels = [
    CordelSummaryViewModel(
        id: 0,
        title: "O SENTIDO DOS SONHOS",
        authorName: "Edison",
        xilogravuraUrl:
            "https://xilos.ecordel.com.br/70e942ec-65a1-424d-9bfc-856fc6b0219a.jpg"),
    CordelSummaryViewModel(
        id: 1,
        title: "A vaca louca",
        authorName: "Edison",
        xilogravuraUrl:
            "https://xilos.ecordel.com.br/70e942ec-65a1-424d-9bfc-856fc6b0219a.jpg"),
    CordelSummaryViewModel(
        id: 3,
        title: "Padre Cicero Romão",
        authorName: "Edison",
        xilogravuraUrl:
            "https://xilos.ecordel.com.br/70e942ec-65a1-424d-9bfc-856fc6b0219a.jpg"),
    CordelSummaryViewModel(
        id: 4,
        title: "Na minha terra",
        authorName: "Edison",
        xilogravuraUrl:
            "https://xilos.ecordel.com.br/70e942ec-65a1-424d-9bfc-856fc6b0219a.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    var controller = HomeController(context: context);

    return Scaffold(
      appBar: AppBar(
        title: Text('E-Cordel'),
      ),
      body: FutureBuilder<List<CordelSummaryViewModel>>(
        future: controller.getSummary(),
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.hasData) {
            return buildGridView(snapshot.data);
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
    );
  }

  Widget buildGridView(var cordels) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: this.cordels.length,
      itemBuilder: (ctx, index) => EcordelCard(cordel: this.cordels[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 10,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
