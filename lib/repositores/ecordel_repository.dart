import 'dart:developer';

import 'package:dio/dio.dart';
import '../models/cordel_summary.dart';
import '../configs/env_config.dart';
import '../models/ecordel.dart';

class EcordelRepositoryAPI implements EcordelRepository {
  final Dio dio = Dio();
  final String cordelsUrl = EnvironmentConfig.API_URL + '/cordels';
  final String content = 'content';

  Map<String, String>? request;

  Future<List<CordelSummary>> getSummaries() async {
    try {
      final response = await dio.get("$cordelsUrl/summaries");

      var cordelsSummary = (response.data[content] as List).map((e) {
        return CordelSummary.fromMap(e);
      }).toList();

      return cordelsSummary;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Cordel> getById(int id) async {
    final String url = '$cordelsUrl/$id';
    var response;

    try {
      response = await dio.get(url);
    } catch (e) {
      rethrow;
    }

    Cordel cordel = Cordel.fromMap(response.data);
    return cordel;
  }

  Future<List<CordelSummary>> searchByTitle(String title) async {
    final String url = '$cordelsUrl/summaries?title=$title';
    log('search url: $url');
    try {
      final response = await dio.get(url);

      var cordelsSummary = (response.data[content] as List).map((e) {
        return CordelSummary.fromMap(e);
      }).toList();

      return cordelsSummary;
    } catch (e) {
      rethrow;
    }
  }
}

abstract class EcordelRepository {
  Future<List<CordelSummary>> getSummaries() async {
    throw UnimplementedError();
  }

  Future<Cordel> getById(int id) async {
    throw UnimplementedError();
  }

  Future<List<CordelSummary>> searchByTitle(String title) async {
    throw UnimplementedError();
  }
}
