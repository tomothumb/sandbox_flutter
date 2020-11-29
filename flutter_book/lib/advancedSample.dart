import 'package:flutter/material.dart';

import 'advancedSampleData.dart';
import 'advancedSampleSub.dart';
import 'advancedSampleSubNoRef.dart';

class AdvancedSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyWidget(title:'Advanced test');
  }
}

class MyWidget extends StatefulWidget {
  final String title;

  MyWidget({Key key, this.title}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  ImportantData importantData = ImportantData();

  _hundleDataIncrement(){
    setState((){
      importantData.increment();
    });
  }

  @override
  Widget build(BuildContext context) {

    debugPrint('MyWidget is built');

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                Text('111'),
                AdvancedSampleSub(importantData: importantData),
                advancedSampleSubNoRef()
              ],
            )
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _hundleDataIncrement,
        tooltip: "Increment",
        child: Text('Add'),
      ),
      backgroundColor: Colors.lightGreen,
    );
  }
}


