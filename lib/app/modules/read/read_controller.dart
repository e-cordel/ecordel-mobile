import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'read_controller.g.dart';

@Injectable()
class ReadController = _ReadControllerBase with _$ReadController;

abstract class _ReadControllerBase with Store {
  @observable
  double fontScaleFactor = 1.0;

  @action
  void addFontScale() {}

  @action
  void subFontScale() {}
}
