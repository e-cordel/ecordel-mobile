import 'package:dio/dio.dart';
import 'package:ecordel/app/modules/read/read_module.dart';
import 'package:ecordel/app/share/repositores/ecordel_repository.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:ecordel/app/app_widget.dart';
import 'package:ecordel/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => Dio()),
        Bind((i) => EcordelRepositoryAPI()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/read', module: ReadModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
