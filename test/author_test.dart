import 'package:ecordel/models/author.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('If a null map is passed then return and empty author', () {
    Author author = Author.fromMap(null);
    expect(author, isNotNull);
    expect(author.name, isNull);
  });
}
