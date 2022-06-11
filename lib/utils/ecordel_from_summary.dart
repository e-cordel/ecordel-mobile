import '../models/cordel_summary.dart';
import 'package:ecordel/models/author.dart';
import 'package:ecordel/models/ecordel.dart';

Cordel castToCordelFromSummary(CordelSummary cordelSummary) {
  return Cordel(
      id: cordelSummary.id,
      author: Author(name: cordelSummary.authorName),
      title: cordelSummary.title,
      xilogravuraUrl: cordelSummary.xilogravuraUrl);
}
