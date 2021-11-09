import 'package:ecordel/models/cordel_summary.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('xilogravuraUrl may be null', () {
    var xiloUrl;
    var summary = CordelSummary(
        id: 1,
        title: "title",
        authorName: "authorName",
        xilogravuraUrl: xiloUrl);
    expect(summary, isNotNull);
    expect(summary.xilogravuraUrl, isNull);
  });
}
