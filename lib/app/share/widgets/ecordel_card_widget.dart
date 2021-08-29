import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ecordel/app/share/models/cordel_summary_viewmodel.dart';
import 'package:ecordel/app/share/utils/images.dart';

class CordelCard extends StatelessWidget {
  final CordelSummaryViewModel cordelSummary;

  const CordelCard({
    Key? key,
    required this.cordelSummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/read', arguments: cordelSummary.id);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                flex: 10,
                child: getXilogravuraImageOrDefault(
                    cordelSummary.xilogravuraUrl, BoxFit.fill)),
            Flexible(
              flex: 1,
              child: Text(
                '${cordelSummary.title}',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                '${cordelSummary.authorName}',
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
