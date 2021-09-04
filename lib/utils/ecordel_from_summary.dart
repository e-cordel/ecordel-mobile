import '../models/cordel_summary.dart';
import 'package:ecordel/models/author.dart';
import 'package:ecordel/models/ecordel.dart';

Ecordel castToCordelFromSummary(CordelSummary cordelSummary) {
  return Ecordel(
      id: cordelSummary.id,
      author: Author(name: cordelSummary.authorName),
      title: cordelSummary.title,
      xilogravuraUrl: cordelSummary.xilogravuraUrl);
}
