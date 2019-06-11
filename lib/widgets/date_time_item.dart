import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeItem extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  DateTimeItem({Key key, DateTime dateTime, @required this.onChanged})
      : assert(onChanged != null),
        date = dateTime == null
            ?  DateTime.now()
            :  DateTime(dateTime.year, dateTime.month, dateTime.day),
        time = dateTime == null
            ?  DateTime.now()
            :  TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Row(
      children: <Widget>[
         Expanded(
          child:  InkWell(
            onTap: (() => _showDatePicker(context)),
            child:  Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.0),
                child:  Text( DateFormat('EEEE, MMMM d').format(date))),
          ),
        ),
         InkWell(
          onTap: (() => _showTimePicker(context)),
          child:  Padding(
              padding:  EdgeInsets.symmetric(vertical: 8.0),
              child:  Text('${time.format(context)}')),
        ),
      ],
    );
  }

  Future _showDatePicker(BuildContext context) async {
    DateTime dateTimePicked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date.subtract(const Duration(days: 20000)),
        lastDate:  DateTime.now());

    if (dateTimePicked != null) {
      onChanged( DateTime(dateTimePicked.year, dateTimePicked.month,
          dateTimePicked.day, time.hour, time.minute));
    }
  }

  Future _showTimePicker(BuildContext context) async {
    TimeOfDay timeOfDay =
    await showTimePicker(context: context, initialTime: time);

    if (timeOfDay != null) {
      onChanged( DateTime(
          date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute));
    }
  }
}