
import 'package:flutter/material.dart';
import 'package:weight_tracker/models/weight_history.dart';
import 'package:weight_tracker/utils/random_generator.dart';
import 'package:weight_tracker/widgets/WeightItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightItem> weightList = [];

  void _handleAddButton() {
    double lastWeight = weightList.length > 0 ? weightList.last.weight : 0;

    setState(() {
      //create new weight item
      WeightHistory weightEntry = WeightHistory (dateTime: getRandomDate(),
          weight: getRandomDouble());
      WeightItem item = WeightItem ( dateTime: weightEntry.dateTime,
        weight: weightEntry.weight,
        difference: weightList.isNotEmpty ? weightEntry.weight - lastWeight : 0);

      // add it to the list
      weightList.add(item);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Tracker'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: weightList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return weightList[index];
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _handleAddButton();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
