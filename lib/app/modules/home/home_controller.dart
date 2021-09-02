import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:ecordel/app/share/models/cordel_summary_viewmodel.dart';
import 'package:ecordel/app/share/repositores/ecordel_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  var ecordelRepositoryAPI = Modular.get<EcordelRepositoryAPI>();
  var cordelsSummary = ObservableList<CordelSummaryViewModel>();

  @observable
  bool isLoading = false;

  @action
  Future<List<CordelSummaryViewModel>> getSummary() async {
    await refreshSummary();
    return List.from(cordelsSummary);
  }

  @action
  Future<void> refreshSummary() async {
    try {
      isLoading = true;
      var summary = await ecordelRepositoryAPI.fetchCordelSumary();
      cordelsSummary = ObservableList.of(summary);
      isLoading = false;
    } catch (e) {
      rethrow;
    }
  }
}
