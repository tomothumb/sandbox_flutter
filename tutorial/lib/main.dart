import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;

    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  Widget titleSection = Container(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('bbbbbbbb',
                        style: TextStyle(fontWeight: FontWeight.bold)
                    )
                ),
                Text('xxxxxxxxxx',
                    style: TextStyle(color: Colors.grey[500]))
              ],
            )
        ),
        Icon(Icons.star, color: Colors.red[500],),
        Text('41'),
      ],
    ),
  );

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Text(label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: color,
                  )
              )
          ),
        ]
    );
  }

  Widget buttonSection(context) {
    Color color = Theme
        .of(context)
        .primaryColor;

    return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButtonColumn(color, Icons.call, 'Call'),
            _buildButtonColumn(color, Icons.near_me, 'Route'),
            _buildButtonColumn(color, Icons.share, 'Share'),
          ],
        )
    );
  }

  Widget textSection = Container(
      padding: const EdgeInsets.all(30),
      child: Text(
        'asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfasasdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfasasdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfasasdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfasasdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfasasdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfasasdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfasasdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas asdfasfasf asfasfa sadfasd asdfasdfas fsf asfasdfasdf asdfas',
        softWrap: true,
      )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter Layout Demo')),
        body: ListView(
            children: [
              Image.asset(
                'images/sample.jpg',
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection(context),
              textSection
            ]
        )
    );
  }
}
