import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

void main() {
  runApp(MaterialApp(
    title: 'My app',
    home: MyScaffold(),
  ));
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: <Widget>[
        MyAppBar(
            title: Text('Example title',
                style: Theme.of(context).primaryTextTheme.headline6)),
        Expanded(child: Center(child: Text('Hello world')))
      ],
    ));
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: Colors.blue[500]),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              tooltip: "Navigation menu",
              onPressed: null,
            ),
            Expanded(
              child: title,
            ),
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: null,
            )
          ],
        ));
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Startup Name Generator',
//         theme: ThemeData(
//           primaryColor: Colors.white,
//         ),
//         home: RandomWords());
//   }
// }
//
// class RandomWords extends StatefulWidget {
//   @override
//   _RandomWordsState createState() => _RandomWordsState();
// }
//
// class _RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _saved = Set<WordPair>();
//   final _biggerFont = TextStyle(fontSize: 12.0);
//
//   Widget _buildSuggestions() {
//     return ListView.builder(
//       padding: EdgeInsets.all(10),
//       itemBuilder: (context, i) {
//         if (i.isOdd) {
//           return Divider();
//         }
//         final index = i ~/ 2; //
//         if (index >= _suggestions.length) {
//           _suggestions.addAll(generateWordPairs().take(10));
//         }
//         return _buildRow(_suggestions[index]);
//       },
//     );
//   }
//
//   Widget _buildRow(WordPair pair) {
//     final alreadySaved = _saved.contains(pair);
//     return ListTile(
//         title: Text(pair.asPascalCase, style: _biggerFont),
//         trailing: Icon(
//           alreadySaved ? Icons.favorite : Icons.favorite_border,
//           color: alreadySaved ? Colors.red : null,
//         ),
//         onTap: () {
//           setState(() {
//             if (alreadySaved) {
//               _saved.remove(pair);
//             } else {
//               _saved.add(pair);
//             }
//           });
//         });
//   }
//
//   void _pushSaved() {
//     Navigator.of(context)
//         .push(MaterialPageRoute<void>(builder: (BuildContext context) {
//       final tiles = _saved.map((WordPair pair) {
//         return ListTile(
//             title: Text(
//           pair.asPascalCase,
//           style: _biggerFont,
//         ));
//       });
//
//       final divided = ListTile.divideTiles(
//         context: context,
//         tiles: tiles,
//       ).toList();
//
//       return Scaffold(
//           appBar: AppBar(title: Text('Saved Suggestions')),
//           body: ListView(children: divided));
//     }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Startup Name Generator'),
//           actions: [
//             IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
//           ],
//         ),
//         body: _buildSuggestions());
//   }
// }
