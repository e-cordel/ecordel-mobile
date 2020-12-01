import 'package:ecordel/app/commons/models/author.dart';
import 'package:ecordel/app/commons/models/cordel_summary.dart';
import 'package:ecordel/app/commons/models/ecordel.dart';
import 'package:ecordel/app/commons/models/xilogravura.dart';

Ecordel castToCordelFromSummary(CordelSummary cordelSummary) {
  return Ecordel(
      id: cordelSummary.id,
      author: Author(name: cordelSummary.authorName),
      title: cordelSummary.title,
      xilogravura: Xilogravura(url: cordelSummary.xilogravuraUrl));
}
