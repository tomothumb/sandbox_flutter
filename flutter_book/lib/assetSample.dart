import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class AssetSampleScreen extends StatelessWidget {

  final String _t = 'xxx';

  Future<String> getFileDataSampleJson() async {
    return rootBundle.loadString('./assets/sample.json');
  }

  @override
  Widget build(BuildContext context) {

    print(1112233);
    print(1112233);
    print(getFileDataSampleJson().then((v) {
      print(v);
    }));

    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Sample')
      ),
      body: Column(
        children: [
          Text('Assets'),
          Text('JSON:'),
          FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('./assets/sample.json'),
            builder: (context, snapshot) {
              return Text(snapshot.data);
            },
          ),
          Text('Image:'),
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('./assets/images/250x50.png'),
              )
            ),
          ),
          RaisedButton(
            onPressed: (){
              // getSampleJson();
            },
            child: Text('> LOAD JSON <'),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('back'),
          )
        ],
      )
    );

  }
}
