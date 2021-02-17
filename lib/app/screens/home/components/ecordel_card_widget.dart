import 'package:ecordel/app/commons/models/ecordel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../read/read_page.dart';

class CordelCard extends StatelessWidget {
  final Ecordel cordel;

  const CordelCard({
    Key key,
    this.cordel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 5,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadScreen(
                      cordelId: this.cordel.id,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 3,
                      color: Colors.grey.withOpacity(0.5),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    this.cordel.xilogravura.url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
