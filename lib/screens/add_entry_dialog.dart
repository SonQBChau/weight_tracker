import 'package:flutter/material.dart';
import 'package:weight_tracker/models/weight_history.dart';
import 'package:weight_tracker/utils/random_generator.dart';
import 'package:weight_tracker/widgets/date_time_item.dart';
import 'package:flutter_picker/flutter_picker.dart';

class AddEntryDialog extends StatefulWidget {

  // create a random Weight object and pop it back to home page
  @override
  _AddEntryDialogState createState() => _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  DateTime _dateTime = new DateTime.now();
  double _weight = 120.2;


  void _handleSaveButton(context) {
    Navigator.of(context).pop(
      // set random weight history
        WeightHistory (dateTime: getRandomDate(), weight: getRandomDouble())
    );
  }

  showPickerNumber(BuildContext context) {
    // split the double number to 2 integers, 137.4 -> 137 and 4
    int wholeNumber = _weight.toInt();
    int decimalDigit = ((_weight - wholeNumber) * 10).toInt() ;
     Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(begin: 100, end: 200),
          NumberPickerColumn(begin: 0, end: 9),
        ]),
        delimiter: [
          PickerDelimiter(child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        selecteds: [wholeNumber -100, decimalDigit],
        hideHeader: true,
        title: new Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
          setState(() {
            double value = picker.getSelectedValues()[0] + picker.getSelectedValues()[1]/10;
            _weight = value;
          });
        }
    ).showDialog(context);
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
      body: ListView(
        children: <Widget>[
          ListTile(
            leading:  Icon(Icons.today, color: Colors.grey[500]),
            title:  DateTimeItem(
              dateTime: _dateTime,
              onChanged: (dateTime) => setState(() => _dateTime = dateTime),
            ),
          ),
          ListTile(
            leading:  Icon(Icons.accessibility, color: Colors.grey[500]),
            title: Text('$_weight lbs'),
            onTap: () { showPickerNumber(context); },
          ),
        ],
      ),
    );
  }


}


