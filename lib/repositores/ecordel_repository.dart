import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../models/cordel_summary_viewmodel.dart';
import '../configs/env_config.dart';
import '../models/ecordel.dart';

class EcordelRepositoryAPI implements EcordelRepository {
  var dio = Dio();
  String cordelsUrl = EnvironmentConfig.API_URL + '/cordels';

  Map<String, String>? request;

  Future<List<CordelSummaryViewModel>> getCordelSumary() async {
    try {
      final response = await dio.get(cordelsUrl);

      var cordelsSummary = (response.data['content'] as List).map((e) {
        return CordelSummaryViewModel.fromMap(e);
      }).toList();

      return cordelsSummary;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Ecordel> getById(int id) async {
    final String url = '$cordelsUrl/$id';
    var response;

    try {
      response = await dio.get(url);
    } catch (e) {
      rethrow;
    }

    Ecordel cordel = Ecordel.fromMap(response.data);
    return cordel;
  }

  Future<List<CordelSummaryViewModel>> searchByTitle(String title) async {
    final String url = '$cordelsUrl?title=$title';
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
}

abstract class EcordelRepository {
  Future<List<CordelSummaryViewModel>> getCordelSumary() async {
    throw UnimplementedError();
  }

  Future<Ecordel> getById(int id) async {
    throw UnimplementedError();
  }

  Future<List<CordelSummaryViewModel>> searchByTitle(String title) async {
    throw UnimplementedError();
  }
}
