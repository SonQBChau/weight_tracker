
import 'package:flutter/material.dart';
import 'package:weight_tracker/models/weight_item.dart';
import 'package:weight_tracker/screens/entry_dialog.dart';
import 'package:weight_tracker/utils/random_generator.dart';
import 'package:weight_tracker/widgets/weight_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightWidget> _weightList = [];


  void _addToWeightList(WeightItem weightItem) {
    // create weight item with difference from the previous entry
    String _weightDiffence = _weightList.isNotEmpty ? (weightItem.weight - _weightList.last.weightItem.weight).toStringAsFixed(1) : '0';
    setState(() {
      WeightWidget item = WeightWidget (weightItem: weightItem,
        difference: _weightDiffence);
      // add it to the list
      _weightList.add(item);
    });
  }

  // open new dialog to create weight object and get the result back
  void _addNewEntry() async{
    WeightItem newWeightItem = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return EntryDialog();
    },
      fullscreenDialog: true,
    ));

    if(newWeightItem != null){
      _addToWeightList(newWeightItem);
    }
  }

  // edit the existing item
  _editEntry(WeightWidget item) async{
    WeightItem editItem = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return EntryDialog(dateTime: item.weightItem.dateTime, weight: item.weightItem.weight, note: item.weightItem.note,);
    },
      fullscreenDialog: true,
    ));

    if(editItem != null){
//      String _weightDiffence = _weightList.isNotEmpty ? (weightItem.weight - _weightList.last.weightItem.weight).toStringAsFixed(1) : '0';
      WeightWidget editWeightWidget = WeightWidget (weightItem: editItem, difference: '0');
      _weightList[_weightList.indexOf(item)] = editWeightWidget;
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
            return InkWell(
                onTap: () => _editEntry(_weightList[index]),
                child: _weightList[index]
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        _addNewEntry();

        },
        child: Icon(Icons.add),
      ),
    );
  }


}
