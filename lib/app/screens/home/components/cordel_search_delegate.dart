import 'package:ecordel/app/commons/models/cordel_summary.dart';
import 'package:ecordel/app/commons/utils/ecordel_from_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecordel/app/commons/models/ecordel.dart';
import 'package:ecordel/app/commons/providers/cordel_provider.dart';

import 'ecordel_card_widget.dart';

class EcordelSearch extends SearchDelegate<Ecordel> {
  String searchFieldLabel = "";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length == 0) {
      return Center(child: Text("Digite um titulo para pesquisar"));
    }

    return FutureBuilder(
      future: Provider.of<EcordelProvider>(context, listen: false)
          .searchByTitle(query),
      builder: (context, snapshot) {
        List<CordelSummary> tempResult = [];

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          tempResult = snapshot.data;
        }

        if (tempResult.length == 0) {
          return Center(child: Text('Nenhum cordel encontrado =('));
        } else {
          return _buildGridView(tempResult);
        }
      },
    );
  }

  Widget _buildGridView(List<CordelSummary> results) {
    return GridView.count(
      childAspectRatio: 0.75,
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(
        results.length,
        (index) {
          Ecordel cordel = castToCordelFromSummary(results[index]);
          return CordelCard(
            cordel: cordel,
          );
        },
      ),
    );
  }
}
