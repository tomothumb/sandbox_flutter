import 'package:flutter/material.dart';

import 'advancedSampleData.dart';
import 'advancedSampleSub2.dart';

class AdvancedSampleSub extends StatefulWidget {

  final ImportantData importantData;

  AdvancedSampleSub({Key key, @required this.importantData})
    : assert(importantData != null),
      super(key: key);

  @override
  _AdvancedSampleSubState createState() => _AdvancedSampleSubState();
}

class _AdvancedSampleSubState extends State<AdvancedSampleSub> {

  ImportantData get _importantData => widget.importantData;

  @override
  Widget build(BuildContext context) {
    debugPrint('Sub Widget');
    return Container(
      height:150,
      decoration: BoxDecoration(
        color: Colors.cyan,
      ),
      child: Column(
        children: <Widget>[
          Text('Sub Widget'),
          AdvancedSampleSub2(importantData:_importantData)

        ],
      )
    );
  }
}

