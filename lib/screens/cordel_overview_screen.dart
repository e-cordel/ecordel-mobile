import 'package:ecordel/dummy/cordeis_duumy.dart';
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
  bool _isLoading = false;
  bool _isInit = true;
  @override
  
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        this._isLoading = true;
      });

      Provider.of<EcordelProvider>(context).fethAll().then((_) {
        setState(() {
          this._isLoading = false;
        });
      });
    }
    this._isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext conteRxt) {
    final eCordelProvider = Provider.of<EcordelProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Cordeis'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     onPressed: () {
        //       showSearch(context: context, delegate: EcordelSearch());
        //     },
        //   ),
        // ],
      ),
      body: this._isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Container(
            color: Theme.of(context).backgroundColor,
                      child: GridView.count(
              
                childAspectRatio: 0.75,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(eCordelProvider.getAll().length, (index) {
                  Ecordel cordel = eCordelProvider.getAll().elementAt(index);
                  return ChangeNotifierProvider.value(
                    value: cordel,
                    child: BookWidget(),
                  );
                }),
              ),
          ),
    );
  }

}
// ===================================== SEARCH

class EcordelSearch extends SearchDelegate<Ecordel> {
  List<Ecordel> _cordeis = [];

  void loadData(BuildContext context) async {
    EcordelProvider _ecordelProvider =
        Provider.of<EcordelProvider>(context, listen: false);
    await _ecordelProvider.fethAll();
    this._cordeis = await _ecordelProvider.getAll();
  }

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
    loadData(context);

    if (query.length == 0) {
      return Center(child: Text("Digite um titulo para pesquisar"));
    }

    var results = this._cordeis.where((element) {
      return element.description.toLowerCase().contains(query);
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
