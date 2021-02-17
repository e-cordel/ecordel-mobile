import 'package:flutter/material.dart';

class SectionCategory extends StatelessWidget {
  final String sectionName;

  const SectionCategory({
    Key key,
    this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.local_library,
            size: 25,
            color: Colors.black45,
          ),
          Padding(padding: EdgeInsets.all(6)),
          Text(
            sectionName,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
