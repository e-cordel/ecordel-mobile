import 'package:ecordel/app/share/models/ecordel.dart';
import 'package:ecordel/app/share/repositores/ecordel_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'read_controller.g.dart';

@Injectable()
class ReadController = _ReadControllerBase with _$ReadController;

abstract class _ReadControllerBase with Store {
  @observable
  double fontScaleFactor = 1.0;
  @observable
  bool isLoading = false;

  var ecordelRepositoryAPI = Modular.get<EcordelRepositoryAPI>();

  @action
  Future<Ecordel> fetchCordelById(int id) async {
    try {
      isLoading = true;
      var cordel = await ecordelRepositoryAPI.fethById(id);
      isLoading = false;
      return cordel;
    } catch (e) {
      rethrow;
    }
  }

  @action
  void addFontScale() {
    if (fontScaleFactor <= 1.8) {
      fontScaleFactor += 0.2;
    }
  }

  @action
  void subFontScale() {
    if (fontScaleFactor >= 1.2) {
      fontScaleFactor -= 0.2;
    }
  }
}
