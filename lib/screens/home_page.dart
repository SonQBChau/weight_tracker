import 'package:flutter/material.dart';
import 'package:weight_tracker/widgets/WeightItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> myList = [];

  void _handleAddButton() {
    setState(() {
      myList.add('new string');
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
          itemCount: myList.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return WeightItem();
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
