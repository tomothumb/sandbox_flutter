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

  _MyWidgetState _myWidgetState;
  _MyWidgetState get state => _myWidgetState;

  MyWidget({Key key, this.title}) : super(key: key);

  @override
  _MyWidgetState createState() {
    _myWidgetState = _MyWidgetState();
    return _myWidgetState;
  }
}

class _MyWidgetState extends State<MyWidget> {

  ImportantData importantData = ImportantData();
  GlobalKey<AdvancedSampleSubState> advancedSampleSubStateGlobalKey = GlobalKey();

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
                Text('AdvancedSampleSubState Direct Sample: ${advancedSampleSubStateGlobalKey.currentState?.widget?.importantData?.count ?? "empty"}'),
                AdvancedSampleSub(
                    key: advancedSampleSubStateGlobalKey,
                    importantData: importantData),
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


