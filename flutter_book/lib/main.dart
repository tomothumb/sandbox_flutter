import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green,),
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star, color: Colors.green),
        Icon(Icons.star),
        Icon(Icons.star),
      ],
    );

    final rating = Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '170 reviews',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 0.5,
                  fontFamily: 'Roboto'
              ),
            ),
            stars,
          ],
        )
    );

    final descTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.red,
      letterSpacing: 0.5,
      fontSize: 20,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.kitchen, color: Colors.green),
                    Text('ki')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.timer, color: Colors.green),
                    Text('Ti')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.restaurant, color: Colors.green),
                    Text('Re')
                  ],
                ),

              ],
            )
        )
    );

    final leftcolumn = Container(
        padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('title'),
            Text('subtitle'),
            rating,
            iconList,
          ],
        )
    );

    final sample = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: leftcolumn,
            width: 200,
          ),
          Image.asset('images/150x150.png'),
        ]
    );

    return MaterialApp(
        title: 'Flutter app',
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        home: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  sample,
                  Text('Flutter app',
                      style: Theme
                          .of(context)
                          .textTheme
                          .display1)
                ],
              ),
            )
        )
    );
  }
}
