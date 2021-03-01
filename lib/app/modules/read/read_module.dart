import 'read_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'read_page.dart';

class ReadModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ReadController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ReadPage(
                  cordelId: args.data,
                )),
      ];

  static Inject get to => Inject<ReadModule>.of();
}
