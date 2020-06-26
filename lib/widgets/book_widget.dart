import 'dart:io';

import '../models/ecordel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../screens/read_screen.dart';
import '../providers/cordel_provider.dart';

class BookWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Ecordel cordel = Provider.of<Ecordel>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.5),
      ),
      // width: 175,
      // height: 375,
      // height: 400,

      child: Column(
        children: <Widget>[
          Flexible(
            flex: 5,
            child: InkWell(
              borderRadius: BorderRadius.zero,
              splashColor: Theme.of(context).primaryColor,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReadScreen(
                            cordelId: cordel.id,
                           )));
              },
              child: Container(
                width: 177,
                height: 240,
                child: Image.network(cordel.xilogravura,fit: BoxFit.cover,),
                
                // child: Ink.image(
                //   // image: AssetImage(this.xilogravuraUrl),
                //   image: AssetImage(cordel.xilogravura),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
