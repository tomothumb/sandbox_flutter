import 'package:flutter/material.dart';

import 'advancedSampleData.dart';

class AdvancedSampleSub3 extends StatefulWidget {

  final ImportantData importantData;

  AdvancedSampleSub3({Key key, @required this.importantData})
    : assert(importantData != null),
      super(key: key);

  @override
  _AdvancedSampleSub3State createState() => _AdvancedSampleSub3State();
}

class _AdvancedSampleSub3State extends State<AdvancedSampleSub3> {

  ImportantData get _importantData => widget.importantData;

  @override
  Widget build(BuildContext context) {
    debugPrint('Sub3 Widget');
    return Container(
      height:50,
      decoration: BoxDecoration(
        color: Colors.orange,
      ),
      child: Column(
        children: <Widget>[
          Text('Sub3 Widget'),
          Text('ImportantData: ${_importantData.count}')
        ],
      )
    );
  }
}

