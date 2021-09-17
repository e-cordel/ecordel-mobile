import 'package:ecordel/app/share/models/cordel_summary_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:ecordel/models/author.dart';

class EcordelCard extends StatelessWidget {
  CordelSummaryViewModel cordel;

  EcordelCard({required this.cordel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          cordel.xilogravuraUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_book_outlined),
          ),
          title: Text(
            cordel.title,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
