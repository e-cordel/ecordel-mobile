import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cordel_provider.dart';
import '../../screens/home/components/body.dart';
import '../../widgets/notification_icon_widget.dart';
import '../../widgets/book_card_widget.dart';
import '../../models/ecordel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _CustomAppBarScreenState createState() => _CustomAppBarScreenState();
}

class _CustomAppBarScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  bool _errorOnFech = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });

    Provider.of<EcordelProvider>(context, listen: false).fethAll().then((_) {
      setState(() {
        this._isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        print(error);
        _errorOnFech = true;
        _isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var scaffold = Scaffold.of(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _errorOnFech
                ? Container(
                    color: Colors.orange[50],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Um erro ocorreu ao tentar obter os dados =(',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  )
                : Body(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        color: Colors.grey,
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          color: Colors.grey,
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: EcordelSearch());
          },
        ),
        NotificationButtonWidget(),
      ],
      elevation: 14,
    );
  }
}

// EcordelSearch

class EcordelSearch extends SearchDelegate<Ecordel> {
  String searchFieldLabel = "";
  List<Ecordel> _cordeis = [];

  void loadData(BuildContext context) async {
    EcordelProvider _ecordelProvider =
        Provider.of<EcordelProvider>(context, listen: false);
    await _ecordelProvider.fethAll();
    this._cordeis = _ecordelProvider.getAll();
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
      return element.title.toLowerCase().contains(query);
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
          child: BookCard(),
        );
      }),
    );
  }
}
