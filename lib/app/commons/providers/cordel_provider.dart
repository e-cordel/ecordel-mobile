import 'dart:convert';

import 'package:ecordel/app/commons/models/cordel_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../api_configs.dart';
import '../models/ecordel.dart';

class EcordelProvider with ChangeNotifier {
  String baseUrl = API_URL;
  List<Ecordel> _cordeis = [];
  Map<String, String> request;

  // Return a home summary
  Future<List<CordelSummary>> getCordelSumary() async {
    final String url = baseUrl + '/cordels';
    try {
      final response = await http.get(url);

      var decoded = jsonDecode(response.body)['content'];
      List<Map<String, dynamic>> parsed = List.from(decoded);

      return parsed.map<CordelSummary>((e) {
        return CordelSummary.fromMap(e);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<Ecordel> fethById(int id) async {
    final response = await http.get(baseUrl + "/cordels/" + "$id");
    Map<String, dynamic> json = jsonDecode(response.body);
    final Ecordel ecordel = Ecordel.fromMap(json);

    return ecordel;
  }

  Future<List<CordelSummary>> searchByTitle(String title) async {
    final String url = "$baseUrl/cordels/?title=$title";
    try {
      final response = await http.get(url);
      var decoded = jsonDecode(response.body)['content'];

      List<Map<String, dynamic>> parsed = List.from(decoded);

      return parsed.map<CordelSummary>((e) {
        var ecordelSummary = CordelSummary.fromMap(e);
        return ecordelSummary;
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  List<Ecordel> getAll() {
    return _cordeis.toList();
  }
}
