import 'package:ecordel/models/ecordel.dart';
import 'package:ecordel/providers/cordel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/book_widget.dart';

class CordelOverviewScreen extends StatefulWidget {
  @override
  _CordelOverviewScreenState createState() => _CordelOverviewScreenState();
}

class _CordelOverviewScreenState extends State<CordelOverviewScreen> {
  var _ecordelProvider;
  @override
  void didChangeDependencies() {
    _ecordelProvider = Provider.of<EcordelProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext conteRxt) {
    final cordeis = _ecordelProvider.getAll();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Cordeis'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: EcordelSearch());
            },
          ),
        ],
      ),
      body: GridView.count(
        childAspectRatio: 0.75,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(cordeis.length, (index) {
          Ecordel cordel = cordeis.elementAt(index);
          return ChangeNotifierProvider.value(
            value: cordel,
            child: BookWidget(),
          );
        }),
      ),
    );
  }
}

class EcordelSearch extends SearchDelegate<Ecordel> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    EcordelProvider _ecordelProvider =
        Provider.of<EcordelProvider>(context, listen: false);
    List<Ecordel> cordeis = _ecordelProvider.getAll();
    if (query.length == 0) {
      return Center(child: Text("Digite um titulo para pesquisar"));
    }

    var results = cordeis.where((element) {
      return element.descriptor.toLowerCase().contains(query);
    });

    if (results.length == 0) {
      return Center(
        child: Text("Nenhum cordel encontrado"),
      );
    }

    return GridView.count(
      childAspectRatio: 0.75,
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: List.generate(results.length, (index) {
        Ecordel cordel = results.elementAt(index);
        return ChangeNotifierProvider.value(
          value: cordel,
          child: BookWidget(),
        );
      }),
    );
  }
}
