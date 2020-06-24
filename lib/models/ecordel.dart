import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Ecordel with ChangeNotifier {
  double id;
  String autor;
  String text;
  String xilogravura; // url
  String descriptor;

  List<String> tags = [
    "engraçado",
    "regional",
    "regionais",
  ];

  Ecordel({
    this.id,
    this.autor,
    this.text,
    this.xilogravura,
    this.descriptor,
  });
}
