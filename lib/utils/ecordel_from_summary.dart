import '../models/cordel_summary_viewmodel.dart';
import 'package:ecordel/app/share/models/author.dart';
import 'package:ecordel/app/share/models/ecordel.dart';
import 'package:ecordel/app/share/models/xilogravura.dart';

Ecordel castToCordelFromSummary(CordelSummaryViewModel cordelSummary) {
  return Ecordel(
      id: cordelSummary.id,
      author: Author(name: cordelSummary.authorName),
      title: cordelSummary.title,
      xilogravura: Xilogravura(url: cordelSummary.xilogravuraUrl));
}
