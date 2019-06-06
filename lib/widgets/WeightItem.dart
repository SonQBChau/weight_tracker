import 'package:flutter/material.dart';

class WeightItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // datetime display
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'July 22, 2017',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Saturday',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // weight display
          Expanded(
            child: Text(
              '90.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          // difference display
          Expanded(
            child: Text(
              '-8.0',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 24,
              ),

            ),
          ),
        ],
      ),
    );
  }
}
