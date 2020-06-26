import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/ecordel.dart';
import '../dummy/cordeis_duumy.dart';

class EcordelProvider with ChangeNotifier {
  String baseUrl = "https://ecordel-restapi.herokuapp.com/cordels";
  List<Ecordel> _cordeis = [];

  Future<void> fethAll() async {
    final response = await http.get("${this.baseUrl}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body)['content'];
      List<Map<String, dynamic>> parsed = body.cast<Map<String, dynamic>>();
      final ecordelMapped =
          parsed.toList(); // map((json) => Ecordel.fromJson(json));
      this._cordeis =
          ecordelMapped.map<Ecordel>((json) => Ecordel.fromJson(json)).toList();
      // this._cordeis.forEach((element) {
      print('Tamanho do array: ${this._cordeis.length}');
      // });

    } else {
      this._cordeis = [];
    }

    // print("########## FETCHALL ################");
    // this._cordeis = Cordeis().cordeis;
    notifyListeners();
  }

  Future<Ecordel> findById(double id) async {
     final response = await http.get("${this.baseUrl}"+"/$id");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Ecordel ecordel = Ecordel.fromJson(body);
      // print(ecordel.toJson());


      
      return ecordel;
    } else {
      this._cordeis = [];
      return null;
    }
    // return _cordeis.firstWhere((cordel) => cordel.id == id); 

    // print("########## FETCHALL ################");
    // this._cordeis = Cordeis().cordeis;
    
    
    // print("getting by this id:  $id");
    // return this._cordeis.firstWhere((element) => element.id == id);
  }

  List<Ecordel> getAll() {
    return _cordeis; // _cordeis.toList();
  }

  Future<void> insert(Ecordel cordel) async {
    print("Inset this cordel: ${cordel.id}");
    notifyListeners();
  }


  Future<Ecordel> fethById(int id) async {
    print('PUXANDO CORDEL: $id');
     final response = await http.get("${this.baseUrl}"+"/${id}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Ecordel ecordel = Ecordel.fromJson(body);
      // print(ecordel.toJson());


      
      return ecordel;
    } else {
      this._cordeis = [];
      return null;
    }
    // return _cordeis.firstWhere((cordel) => cordel.id == id); 

    // print("########## FETCHALL ################");
    // this._cordeis = Cordeis().cordeis;
    
    
    // print("getting by this id:  $id");
    // return this._cordeis.firstWhere((element) => element.id == id);
  }
}
