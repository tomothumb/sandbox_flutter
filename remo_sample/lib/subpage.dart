import 'package:flutter/material.dart';

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Subpage')
        ),
        body: Center(
            child: Text('This is Subpage.')
        )
    );
  }
}
