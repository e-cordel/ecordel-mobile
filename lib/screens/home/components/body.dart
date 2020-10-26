import 'package:ecordel/providers/cordel_provider.dart';
import 'package:ecordel/widgets/book_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.orange[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 90)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.local_library,
                size: 25,
                color: Colors.black45,
              ),
              Padding(padding: EdgeInsets.all(6)),
              Text(
                "Mais lidos",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Container(
            height: 230,
            width: screenSize.size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                var cordeis = Provider.of<EcordelProvider>(context).getAll();
                return ChangeNotifierProvider.value(
                  value: cordeis[index],
                  child: BookCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
