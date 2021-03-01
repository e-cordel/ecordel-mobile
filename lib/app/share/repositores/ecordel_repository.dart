import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ecordel/app/share/models/cordel_summary_viewmodel.dart';
import '../configs/api_config.dart';
import '../models/ecordel.dart';

class EcordelRepositoryAPI implements EcordelRepository {
  var dio = Modular.get<Dio>();
  String baseUrl = API_URL;

  Map<String, String> request;

  Future<List<CordelSummaryViewModel>> fetchCordelSumary() async {
    final String url = baseUrl + '/cordels';
    try {
      final response = await dio.get(url);

      var cordelsSummary = (response.data['content'] as List).map((e) {
        return CordelSummaryViewModel.fromMap(e);
      }).toList();

      return cordelsSummary;
    } catch (e) {
      rethrow;
    }
  }

  Future<Ecordel> fethById(int id) async {
    final String url = baseUrl + "/cordels/" + "$id";

    try {
      final response = await dio.get(url);
      Map<String, dynamic> json = jsonDecode(response.data);
      final Ecordel ecordel = Ecordel.fromMap(json);
      return ecordel;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CordelSummaryViewModel>> searchByTitle(String title) async {
    final String url = "$baseUrl/cordels/?title=$title";
    try {
      final response = await dio.get(url);
      var decoded = jsonDecode(response.data)['content'];

      List<Map<String, dynamic>> parsed = List.from(decoded);

      return parsed.map<CordelSummaryViewModel>((e) {
        var ecordelSummary = CordelSummaryViewModel.fromMap(e);
        return ecordelSummary;
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Ecordel> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<Ecordel>> fetchAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}

abstract class EcordelRepository {
  Future<List<Ecordel>> fetchAll() async {
    throw UnimplementedError();
  }

  Future<List<CordelSummaryViewModel>> fetchCordelSumary() async {
    throw UnimplementedError();
  }

  Future<Ecordel> getById(int id) async {
    throw UnimplementedError();
  }

  Future<List<CordelSummaryViewModel>> searchByTitle(String title) async {
    throw UnimplementedError();
  }
}
