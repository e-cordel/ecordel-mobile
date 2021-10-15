import 'package:ecordel/models/cordel_summary_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/ecordel.dart';
import '../providers/cordeis_provider.dart';
import '../repositores/ecordel_repository.dart';

class HomeController {
  BuildContext context;
  late EcordelProvider ecordelProvider;

  HomeController({
    required this.context,
  }) {
    this.ecordelProvider = Provider.of<EcordelProvider>(context);
  }

  Future<List<CordelSummaryViewModel>> getSummary() async {
    await this.ecordelProvider.fetchSummary();
    return this.ecordelProvider.summary;
  }

  Future<Ecordel> getById(int id) async {
    return await this.ecordelProvider.getById(id);
  }
}
