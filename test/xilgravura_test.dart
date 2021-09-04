import 'package:ecordel/app/share/models/author.dart';
import 'package:ecordel/app/share/models/xilogravura.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('If a null map is passed then return and empty xilogravura', () {
    Xilogravura xilo = Xilogravura.fromMap(null);
    expect(xilo, isNotNull);
    expect(xilo.url, isNull);
  });
}
