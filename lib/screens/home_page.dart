
import 'package:flutter/material.dart';
import 'package:weight_tracker/models/weight_history.dart';
import 'package:weight_tracker/screens/add_entry_dialog.dart';
import 'package:weight_tracker/utils/random_generator.dart';
import 'package:weight_tracker/widgets/weight_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightItem> _weightList = [];


  void _addToWeightList(WeightHistory weightEntry) {
    // first item will have 0 weight difference
    double lastWeight = _weightList.length > 0 ? _weightList.last.weight : 0;
    // create weight item with difference from the previous entry
    setState(() {
      WeightItem item = WeightItem ( dateTime: weightEntry.dateTime,
        weight: weightEntry.weight,
        difference: _weightList.isNotEmpty ? weightEntry.weight - lastWeight : 0);
      // add it to the list
      _weightList.add(item);
    });
  }

  // open new dialog to create weight object and get the result back
  void _openAddEntryDialog() async{
    WeightHistory newItem = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return AddEntryDialog();
    },
      fullscreenDialog: true,
    ));

    if(newItem != null){
      _addToWeightList(newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Tracker'),
      ),
      body: ListView.builder(
          itemCount: _weightList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _weightList[index];
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        _openAddEntryDialog();

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
