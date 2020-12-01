import 'package:flutter/material.dart';

import 'advancedSampleData.dart';
import 'advancedSampleSub2.dart';

class advancedSampleSubNoRef extends StatelessWidget {
  const advancedSampleSubNoRef({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('NoRef Widget');
    return Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: Column(
          children: <Widget>[
            Text('NoRef Widget'),
            Text('MyInherited Widget data is ${MyInherited.of(context, observe: true).importantData.count}'),
          ],
        ));
  }
}

class MyInherited extends InheritedWidget {
  const MyInherited({
    Key key,
    @required this.importantData,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  final ImportantData importantData;

  static MyInherited of(
    BuildContext context, {
    @required bool observe,
  }) {
    return observe
        ? context.dependOnInheritedWidgetOfExactType<MyInherited>()
        : context.getElementForInheritedWidgetOfExactType<MyInherited>().widget as MyInherited;
    // return context.dependOnInheritedWidgetOfExactType<MyInherited>();
  }

  @override
  bool updateShouldNotify(MyInherited old) {
    return old.importantData.count <= importantData.count;
  }
}
