import 'package:flutter/material.dart';
import 'package:weight_tracker/models/weight_history.dart';
import 'package:weight_tracker/utils/random_generator.dart';

class AddEntryDialog extends StatelessWidget {

  // create a random Weight object and pop it back to home page
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
      body: Text('Foo'),
    );
  }


}


