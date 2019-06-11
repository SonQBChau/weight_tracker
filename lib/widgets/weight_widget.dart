import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/models/weight_item.dart';

/*
  CONTAIN ROW WIDGET TO DISPLAY EACH ITEM ON HOMEPAGE
*/
class WeightWidget extends StatelessWidget {
  final String difference;
  final WeightItem weightItem;

  const WeightWidget({
    @required this.weightItem,
    @required this.difference,
  })  : assert(weightItem != null),
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
                  DateFormat("MMMM dd, yyyy").format(weightItem.dateTime),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  DateFormat.EEEE().format(weightItem.dateTime),
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
              weightItem.weight.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          // difference display
          Expanded(
            child: Text(
              difference,
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
