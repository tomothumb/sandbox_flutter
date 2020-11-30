import 'package:flutter/material.dart';
import 'package:flutter_book/advancedSample.dart';

import 'advancedSampleData.dart';
import 'advancedSampleSub2.dart';

class AdvancedSampleSub extends StatefulWidget {

  final ImportantData importantData;

  AdvancedSampleSub({Key key, @required this.importantData})
    : assert(importantData != null),
      super(key: key);

  @override
  AdvancedSampleSubState createState() => AdvancedSampleSubState();
}

class AdvancedSampleSubState extends State<AdvancedSampleSub> {

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
          Text(_importantData?.count.toString()),
          AdvancedSampleSub2(importantData:_importantData)

        ],
      )
    );
  }
}

