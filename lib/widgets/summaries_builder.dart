import 'package:ecordel/models/cordel_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ecordel_card.dart';

class SummariesBuilder extends StatelessWidget {
  final Future<List<CordelSummary>> summaries;

  SummariesBuilder({Key? key, required this.summaries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CordelSummary>>(
      future: summaries,
      builder: (
        context,
        snapshot,
      ) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Text("Nenhum cordel foi encontrado :'("),
            );
          }
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
