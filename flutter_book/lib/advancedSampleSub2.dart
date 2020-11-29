import 'package:flutter/material.dart';
import 'package:flutter_book/advancedSampleSub3.dart';

import 'advancedSampleData.dart';

class AdvancedSampleSub2 extends StatefulWidget {

  final ImportantData importantData;

  AdvancedSampleSub2({Key key, @required this.importantData})
    : assert(importantData != null),
      super(key: key);

  @override
  _AdvancedSampleSub2State createState() => _AdvancedSampleSub2State();
}

class _AdvancedSampleSub2State extends State<AdvancedSampleSub2> {

  ImportantData get _importantData => widget.importantData;

  @override
  Widget build(BuildContext context) {
    debugPrint('Sub2 Widget');
    return Container(
      height:100,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        children: <Widget>[
          Text('Sub2 Widget'),
          AdvancedSampleSub3(importantData:_importantData)
        ],
      )
    );
  }
}

