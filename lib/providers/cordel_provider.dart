import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/ecordel.dart';

class EcordelProvider with ChangeNotifier {
  String baseUrl = "https://ecordel-restapi.herokuapp.com/cordels";
  List<Ecordel> _cordeis = [];

  Future<void> fethAll() async {
    final response = await http.get("${this.baseUrl}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body)['content'];
      List<Map<String, dynamic>> parsed = body.cast<Map<String, dynamic>>();
      final ecordelMapped = parsed.toList();
      this._cordeis =
          ecordelMapped.map<Ecordel>((json) => Ecordel.fromJson(json)).toList();
      print('Tamanho do array: ${this._cordeis.length}');
    } else {
      this._cordeis = [];
    }

    notifyListeners();
  }

  Future<Ecordel> findById(double id) async {
    final response = await http.get("${this.baseUrl}" + "/$id");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Ecordel ecordel = Ecordel.fromJson(body);

      return ecordel;
    } else {
      this._cordeis = [];
      return null;
    }
  }

  List<Ecordel> getAll() {
    return _cordeis.toList();
  }

  Future<void> insert(Ecordel cordel) async {
    print("Inset this cordel: ${cordel.id}");
    notifyListeners();
  }

  Future<Ecordel> fethById(int id) async {
    print('PUXANDO CORDEL: $id');
    final response = await http.get("${this.baseUrl}" + "/$id");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Ecordel ecordel = Ecordel.fromJson(body);

      return ecordel;
    } else {
      this._cordeis = [];
      return null;
    }
  }
}
