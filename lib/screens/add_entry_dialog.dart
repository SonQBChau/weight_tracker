import 'package:flutter/material.dart';
import 'package:weight_tracker/models/weight_history.dart';
import 'package:weight_tracker/utils/random_generator.dart';
import 'package:weight_tracker/widgets/date_time_item.dart';

class AddEntryDialog extends StatefulWidget {

  // create a random Weight object and pop it back to home page
  @override
  _AddEntryDialogState createState() => _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  DateTime _dateTime = new DateTime.now();


  void _handleSaveButton(context) {
    Navigator.of(context).pop(
      // set random weight history
        WeightHistory (dateTime: getRandomDate(), weight: getRandomDouble())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Entry'),
        actions: <Widget>[
          FlatButton(onPressed: (){
            _handleSaveButton(context);
          },
          child: Text('SAVE', style: Theme.of(context).textTheme.subhead.copyWith(color:Colors.white),),
          ),
        ],
      ),
      body: ListTile(
        leading: new Icon(Icons.today, color: Colors.grey[500]),
        title: new DateTimeItem(
          dateTime: _dateTime,
          onChanged: (dateTime) => setState(() => _dateTime = dateTime),
        ),
      ),
    );
  }
}


