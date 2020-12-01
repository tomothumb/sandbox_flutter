import 'package:flutter/material.dart';

import 'advancedSampleData.dart';
import 'advancedSampleSub.dart';
import 'advancedSampleSubNoRef.dart';

class AdvancedSampleScreen extends StatelessWidget {

  GlobalKey<MyWidgetState> myWidgetStateKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    debugPrint('Advanced root is built');

    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Sample'),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text('111'),
              MyWidget(key: myWidgetStateKey),
              const advancedSampleSubNoRef()
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myWidgetStateKey.currentState.hundleDataIncrement();
        },
        tooltip: "Increment",
        child: Text('Add'),
      ),
      backgroundColor: Colors.lightGreen,
    );
  }
}

class MyWidget extends StatefulWidget {

  MyWidget({Key key}) : super(key: key);

  @override
  MyWidgetState createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<MyWidget> {

  ImportantData importantData = ImportantData();
  AdvancedSampleSub advancedSampleSub;

  @override
  void initState() {
    super.initState();
    advancedSampleSub = AdvancedSampleSub(importantData: importantData);
  }

  hundleDataIncrement(){
    setState((){
      importantData.increment();
    });
  }

  @override
  Widget build(BuildContext context) {

    debugPrint('MyWidget is built');

    return Column(
      children: <Widget>[
        Text('AdvancedSampleSubState Direct Sample: ${importantData?.count ?? "empty"}'),
        advancedSampleSub,
      ],
    );
  }
}


