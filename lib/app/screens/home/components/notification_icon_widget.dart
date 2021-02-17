import 'package:flutter/material.dart';

class NotificationButtonWidget extends StatelessWidget {
  const NotificationButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: IconButton(
            color: Colors.grey,
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ),
        Positioned(
          bottom: 30,
          right: 11,
          child: Container(
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
