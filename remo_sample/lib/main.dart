// import 'dart:html';
import 'package:flutter/material.dart';
import './subpage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remo demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remo')
      ),
      body: Center(
        child: RaisedButton(
          child: Text('BUTTON'),
          onPressed: () {
            return Navigator.of(context).push(MaterialPageRoute(
              builder: (context){
                return SubPage();
              }
            )
            );
          },
        )
      )
    );
  }
}
