import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecordel/repositores/page_response.dart';
import '../models/cordel_summary.dart';
import '../configs/env_config.dart';
import '../models/ecordel.dart';

final String cordelsUrl = EnvironmentConfig.API_URL + '/cordels';

class EcordelRepositoryAPI {

  final Dio dio = Dio();

  final String content = 'content';
  final String last = 'last';
  final String number = 'number';
  final String size = 'size';

  Map<String, String>? request;

  Future<PageResponse<CordelSummary>> getSummaries([page=0]) async {
    try {
      final response = await dio.get("$cordelsUrl/summaries?page=$page");
      return buildPageResponse(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Cordel> getById(int id) async {
    final String url = '$cordelsUrl/$id';
    try {
      final response = await dio.get(url);
      return Cordel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<PageResponse<CordelSummary>> searchByTitle(String title, [page=0]) async {
    final String url = '$cordelsUrl/summaries?title=$title';
    log('search url: $url');
    try {
      final response = await dio.get(url);
      return buildPageResponse(response.data);
    } catch (e) {
      rethrow;
    }
  }

  PageResponse<CordelSummary> buildPageResponse(Map<String, dynamic> data) {
    var summaries = (data[content] as List).map((e) {
      return CordelSummary.fromMap(e);
    }).toList();
    return PageResponse(summaries, data[last] as bool, data[number] as int, data[size] as int);
  }

}
