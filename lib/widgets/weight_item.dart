import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*
  CONTAIN ROW WIDGET TO DISPLAY EACH ITEM ON HOMEPAGE
*/
class WeightItem extends StatelessWidget {
  final double difference;
  final double weight;
  final DateTime dateTime;

  const WeightItem({
    @required this.dateTime,
    @required this.weight,
    @required this.difference,
  })  : assert(dateTime != null),
        assert(weight != null),
        assert(difference != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          // datetime display
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  DateFormat("MMMM dd, yyyy").format(dateTime),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  DateFormat.EEEE().format(dateTime),
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
              weight.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          // difference display
          Expanded(
            child: Text(
              difference.toString(),
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
