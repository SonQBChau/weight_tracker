import 'package:flutter/material.dart';

class WeightItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // datetime display
          Column(
            children: <Widget>[
              Text('July 22, 2017'),
              Text('Saturday'),
            ],
          ),
          // weight display
          Text('90'),
          // difference display
          Text('-8.0'),
        ],
      ),
    );
  }
}
