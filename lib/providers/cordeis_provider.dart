import 'package:flutter/foundation.dart';

import '../models/ecordel.dart';
import '../models/cordel_summary_viewmodel.dart';
import '../repositores/ecordel_repository.dart';

class EcordelProvider with ChangeNotifier {
  List<CordelSummaryViewModel> summary = [];
  var cordelRepository = EcordelRepositoryAPI();

  Future<void> fetchSummary() async {
    this.summary = await this.cordelRepository.getCordelSumary();
    notifyListeners();
  }

  Future<Ecordel> getById(int id) async {
    return this.cordelRepository.getById(id);
  }
}
