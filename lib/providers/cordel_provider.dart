import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../models/ecordel.dart';
import '../dummy/cordeis_duumy.dart';

class EcordelProvider with ChangeNotifier {
  List<Ecordel> _cordeis = [];
  EcordelProvider(){
    fethAll();
  }

  Future<void> fethAll() async {
    print("########## FETCHALL ################");
    this._cordeis = Cordeis().cordeis;
    notifyListeners();
  }

  Ecordel findById(int id) {
    print("getting by this id:  $id");
    return this._cordeis.firstWhere((element) => element.id == id);
  }

  List<Ecordel>  getAll() {
    return _cordeis.toList();
  }

  Future<void> insert(Ecordel cordel) async {
    print("Inset this cordel: ${cordel.id}");
    notifyListeners();
  }
}
