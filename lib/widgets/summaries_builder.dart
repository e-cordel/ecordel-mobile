import 'dart:developer';

import 'package:ecordel/models/cordel_summary.dart';
import 'package:flutter/material.dart';

import 'ecordel_card.dart';

class SummariesBuilder extends StatelessWidget {

  final List<CordelSummary> summaries;
  final ScrollController _controller = ScrollController();
  VoidCallback? listener;

  SummariesBuilder({Key? key, required this.summaries, this.listener}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _controller.addListener((){
      if (_controller.position.maxScrollExtent == _controller.offset) {
        log('fim da lista');
        listener?.call();
      }
    });

    return buildGridView(summaries);
  }

  Widget buildGridView(List<CordelSummary> cordels) {
    return GridView.builder(
      controller: _controller,
      padding: EdgeInsets.all(10),
      itemCount: cordels.length,
      itemBuilder: (ctx, index) => EcordelCard(cordel: cordels[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 10,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
