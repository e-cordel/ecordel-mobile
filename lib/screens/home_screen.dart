import 'dart:developer';

import 'package:ecordel/repositores/ecordel_repository.dart';
import 'package:ecordel/repositores/page_response.dart';
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

  late List<CordelSummary> _summaries = [];
  var _controller = TextEditingController();

  late String _title;
  late bool _lastPage;
  late int _pageNumber;
  late bool _error;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _lastPage = false;
    _pageNumber = 0;
    _error = false;
    _loading = true;
    _title = "";
    fetchCordels();
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
                    onPressed: _controller.clear,
                  )),
              onSubmitted: (text) => _searchByTitle(text),
            ),
          ),
        ),
      ),
      body: _buildBody(),
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

  _searchByTitle(String text) async {
    if(text.isEmpty) {
      fetchCordels();
      return;
    }
    try{
      var response = await api.searchByTitle(text);
      setState(() {
        _title = _title;
        _summaries = response.content;
        _lastPage = response.last;
        _pageNumber = response.number;
        _loading = true;
      });
    } catch ( e ) {
      log( 'error: $e');
      setState(() {
        _error = true;
        _loading = false;
      });
    }

  }

  _buildBody() {
    if ( _summaries.isEmpty ) {
      if (_loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (_error){
        return Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  _loading = true;
                  _error = false;
                  fetchCordels();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Ocorreu um erro :'(, toque para tentar novamente."),
              ),
            ));
      }
    }else {
      return SummariesBuilder(
          summaries : _summaries,
          listener: (){
            if(!_lastPage){
              log('next page: ${_pageNumber+1}');
              fetchCordels(_pageNumber+1);
            }
          },
      );
    }
  }

  Future<void> fetchCordels([page=0]) async {
    try{
      var response = await api.getSummaries(page);
      setState(() {
        _summaries.addAll( response.content );
        _lastPage = response.last;
        _pageNumber = response.number;
        _loading = true;
      });
    } catch ( e ) {
      log( 'error: $e');
      setState(() {
        _error = true;
        _loading = false;
      });
    }

  }
}
