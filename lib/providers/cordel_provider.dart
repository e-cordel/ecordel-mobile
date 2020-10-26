import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/ecordel.dart';
import '../configs/api_configs.dart';

class EcordelProvider with ChangeNotifier {
  String baseUrl = apiUrl;
  List<Ecordel> _cordeis = [];
  Map<String, String> request;

  Future<void> fethAll() async {
    try {
      final response = await http.get("${this.baseUrl}/cordels");

      final body = jsonDecode(response.body)['content'];
      List<Map<String, dynamic>> parsed = body.cast<Map<String, dynamic>>();
      final ecordelMapped = parsed.toList();
      this._cordeis =
          ecordelMapped.map<Ecordel>((json) => Ecordel.fromMap(json)).toList();

      notifyListeners();
      // }
    } catch (e) {
      throw (e);
    }
  }

  Future<Ecordel> findById(double id) async {
    final response = await http.get("${this.baseUrl}" + "/$id");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Ecordel ecordel = Ecordel.fromMap(body);

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
    notifyListeners();
  }

  Future<Ecordel> fethById(int id) async {
    final response = await http.get("${this.baseUrl}" + "/$id");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Ecordel ecordel = Ecordel.fromMap(body);

      return ecordel;
    } else {
      this._cordeis = [];
      return null;
    }
  }
}
