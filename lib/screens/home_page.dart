
import 'package:flutter/material.dart';
import 'package:weight_tracker/models/weight_item.dart';
import 'package:weight_tracker/screens/entry_dialog.dart';
import 'package:weight_tracker/widgets/weight_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightItem> _weightList = [];


  // open new dialog to create weight object and get the result back
  void _addNewEntry() async{
    WeightItem newWeightItem = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return EntryDialog();
    },
      fullscreenDialog: true,
    ));

    if(newWeightItem != null){
      setState(() {
        _weightList.add(newWeightItem);
        _weightList.sort();
      });
    }
  }

  // edit the existing item
  _editEntry(WeightItem item) async{
    WeightItem editItem = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return EntryDialog(dateTime: item.dateTime, weight: item.weight, note: item.note,);
    },
      fullscreenDialog: true,
    ));

    if(editItem != null){
      _weightList[_weightList.indexOf(item)] = editItem;
      _weightList.sort();
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
            WeightItem item = _weightList[index];
            // calculate the weight difference as populate the list
            String _weightDiffence = index > 0 ? (item.weight - _weightList[index-1].weight).toStringAsFixed(1) : '0.0';
            return InkWell(
                onTap: () => _editEntry(item),
                child: WeightWidget(weightItem: item, difference: _weightDiffence)
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
