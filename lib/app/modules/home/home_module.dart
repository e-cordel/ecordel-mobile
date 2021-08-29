import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        $HomeController,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => HomePage()),
      ];

  // static Inject get to => Inject<HomeModule>.of();
}
