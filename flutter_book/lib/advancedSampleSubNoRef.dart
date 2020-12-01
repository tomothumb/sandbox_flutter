import 'package:flutter/material.dart';

import 'advancedSampleData.dart';
import 'advancedSampleSub2.dart';

class advancedSampleSubNoRef extends StatelessWidget {
  const advancedSampleSubNoRef({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('NoRef Widget');
    return Container(
        height:100,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Column(
          children: <Widget>[
            Text('NoRef Widget'),
          ],
        )
    );
  }
}
