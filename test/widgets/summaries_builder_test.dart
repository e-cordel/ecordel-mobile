import 'package:ecordel/models/cordel_summary.dart';
import 'package:ecordel/widgets/summaries_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //todo move test to home_screen
  testWidgets('If future is empty it must render a text saying so',
      (WidgetTester tester) async {
    var summaries = List<CordelSummary>.empty();
    await tester.pumpWidget(MaterialApp(
        home: Material(
            child: SummariesBuilder(
      summaries: summaries,
    ))));
    await tester.pump();
    final messageFinder = find.textContaining("Nenhum cordel foi encontrado");
    expect(messageFinder, findsOneWidget);
  });
}
