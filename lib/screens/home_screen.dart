import 'package:ecordel/repositores/ecordel_repository.dart';
import 'package:ecordel/widgets/summaries_builder.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/cordel_summary.dart';

final api = EcordelRepositoryAPI();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<CordelSummary>> summaries;
  var _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    summaries = api.getSummaries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          color: Colors.white,
          child: Center(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Pesquisar por título',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _clearSearch(),
                  )),
              onSubmitted: (text) => _searchByTitle(text),
            ),
          ),
        ),
      ),
      body: SummariesBuilder(summaries: summaries),
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

  _searchByTitle(String text) {
    setState(() {
      summaries = api.searchByTitle(text);
    });
  }

  _clearSearch() {
    _controller.clear();
    setState(() {
      summaries = api.getSummaries();
    });
  }
}
