import 'package:flutter/material.dart';

import 'setting.dart';
import 'webview.dart';
// import 'package:english_words/english_words.dart';

class FramePage extends StatefulWidget {
  @override
  _FramePageState createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {

  int _selectedIndex = 0;

  static List<Widget> _pageList = [
    CustomPage(pannelColor: Colors.cyan, title: 'Home'),
    SettingPage(),
    WebViewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('sample'),
      // ),
      body: _pageList[
      _selectedIndex
      ],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop),
            title: Text('WebView'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}

class CustomPage extends StatelessWidget {
  final Color pannelColor;
  final String title;

  CustomPage({this.pannelColor, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Text(title),
        )
    );
  }
}
