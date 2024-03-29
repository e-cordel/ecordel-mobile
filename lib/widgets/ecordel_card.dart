import 'package:ecordel/utils/images.dart';

import '../models/cordel_summary.dart';
import 'package:ecordel/screens/read_screen.dart';
import 'package:flutter/material.dart';

class EcordelCard extends StatelessWidget {
  final CordelSummary cordel;

  EcordelCard({required this.cordel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReadScreen(
                        summary: cordel,
                      )),
            );
          },
          child:
              getXilogravuraImageOrDefault(cordel.xilogravuraUrl, BoxFit.cover),
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
