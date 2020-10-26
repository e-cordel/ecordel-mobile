import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../models/ecordel.dart';
import '../screens/read_screen/read_screen.dart';

class BookCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Ecordel cordel = Provider.of<Ecordel>(context, listen: false);

    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 5,
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              splashColor: Theme.of(context).primaryColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadScreen(
                      cordelId: cordel.id,
                    ),
                  ),
                );
              },
              child: Card(
                color: Colors.transparent,
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    cordel.xilogravura,
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
