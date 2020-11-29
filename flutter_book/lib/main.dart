import 'package:flutter/material.dart';
import './assetSample.dart';
import './tweenSample.dart';
import './advancedSample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
        '/todo': (context) => TodoListScreen(
                todos: List<Todo>.generate(20, (index) {
              return Todo(
                title: '$index　のTITLE',
                description: '$index　のDESCRIPTION',
              );
            })),
        // '/todo/detail': (context) => TodoDetailScreen(),
        '/selection': (context) => SelectionHomeScreen(),
        '/animation_move': (context) => AnimationMoveHomeScreen(),
        '/state_sample': (context) => StateSampleHomeScreen(),
        '/asset_sample': (context) => AssetSampleScreen(),
        '/tween_sample': (context) => TweenSampleScreen(),
        '/advanced_sample': (context) => AdvancedSampleScreen(),
      },
      theme: ThemeData(primarySwatch: Colors.green),
      // home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Colors.green,
        ),
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
                  fontFamily: 'Roboto'),
            ),
            stars,
          ],
        ));

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
            )));

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
        ));

    final sample = Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        child: leftcolumn,
        width: 200,
      ),
      Image(image: AssetImage('assets/images/150x150.png')),
    ]);

    return Scaffold(
        appBar: AppBar(title: Text('home')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              sample,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text('NextPage'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                      // Navigator.push(context, MaterialPageRoute(
                      //     builder: (context) {
                      //       return SecondScreen();
                      //     }
                      // ));
                    },
                  ),
                  RaisedButton(
                    child: Text('Todos'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/todo');
                    },
                  ),
                  RaisedButton(
                    child: Text('Selection'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/selection');
                    },
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                RaisedButton(
                  child: Text('Animation Move'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/animation_move');
                  },
                ),
                RaisedButton(
                  child: Text('State Sample'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/state_sample');
                  },
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  RaisedButton(
                    child: Text('Asset Sample'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/asset_sample');
                    },
                  ),
                  RaisedButton(
                    child: Text('Tween Sample'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/tween_sample');
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  RaisedButton(
                    child: Text('Advanced Sample'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/advanced_sample');
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Second Page')),
        body: Center(
          child: Column(
            children: [
              Text('second page'),
              RaisedButton(
                child: Text('Go To Home'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}

class Todo {
  final String title;
  final String description;

  Todo({@required this.title, @required this.description})
      : assert(title != null),
        assert(description != null);
}

class TodoListScreen extends StatelessWidget {
  final List<Todo> _todos;

  TodoListScreen({Key key, @required List<Todo> todos})
      : assert(todos != null),
        this._todos = todos,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Todos')),
        body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_todos[index].title),
              onTap: () {
                return Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return TodoDetailScreen(todo: _todos[index]);
                }));
              },
            );
          },
        )
        // Center(
        //   child: Column(
        //     children: [
        //       Text('Todos'),
        //       RaisedButton(
        //         child: Text('Go To Detail'),
        //         onPressed: () {
        //           Navigator.pushNamed(context, '/todo/detail');
        //         },
        //       ),
        //       RaisedButton(
        //         child: Text('Go To Home'),
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // )
        );
  }
}

class TodoDetailScreen extends StatelessWidget {
  final Todo _todo;

  TodoDetailScreen({Key key, @required Todo todo})
      : assert(todo != null),
        this._todo = todo
  // super(key, key)
  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_todo.title)),
        body: Center(
          child: Column(
            children: [
              Text(_todo.description),
              RaisedButton(
                child: Text('Go To Todos'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              RaisedButton(
                child: Text('Go To Home'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          return _handlePress(context);
        },
        child: Text('オプションを選択'));
  }

  Future<void> _handlePress(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionDetailScreen()),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(result)));
  }
}

class SelectionHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Selections')),
        body: Column(
          children: [
            SelectionButton(),
            RaisedButton(
              child: Text('Go To Home'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}

class SelectionDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Selections')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text('選択肢1'),
                  onPressed: () {
                    // return
                    Navigator.pop(context, '選択肢1');
                  },
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text('選択肢2'),
                  onPressed: () {
                    // return
                    Navigator.pop(context, '選択肢2');
                  },
                )),
            // Padding(
            //     padding: EdgeInsets.all(10),
            //     child: RaisedButton(
            //       Text('選択肢2'),
            //       onPressed: () {
            //         // return
            //       },
            //     ))
          ],
        ));
  }
}

class AnimationMoveHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Animation Move')),
        body: Column(
          children: [
            Hero(
              tag: "hero_tag1",
              child: Image.network('https://picsum.photos/200?image=2'),
            ),
            RaisedButton(
              child: Text('Go To Detail'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimationMovedScreen()));
              },
            ),
            RaisedButton(
              child: Text('Go To Home'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}

class AnimationMovedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Hero(
                tag: "hero_tag1",
                child: Image.network('https://picsum.photos/200?image=2'),
              ),
            )));
  }
}

class StateSampleHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('State Sample')),
        body: Center(child: StateSample()));
  }
}

class StateSample extends StatefulWidget {
  @override
  _StateSampleState createState() => _StateSampleState();
}

class _StateSampleState extends State<StateSample> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    void _handleTap(bool newValue) {
      setState(() {
        _active = newValue;
      });
    }

    ;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StateChildWidget(
          onChanged: _handleTap,
          active: _active,
        ),
        RaisedButton(
          child: Text('Go To Home'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

class StateChildWidget extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  StateChildWidget({Key kwy, this.active: false, @required this.onChanged})
      : assert(active != null),
        assert(onChanged != null)
  // super(key: key)
  ;

  @override
  Widget build(BuildContext context) {
    void _handleTap() {
      onChanged(!active);
    }

    return GestureDetector(
        onTap: _handleTap,
        child: Container(
            width: 200,
            height: 80,
            decoration: BoxDecoration(
                color: active ? Colors.green[700] : Colors.red[200]),
            child: Center(
                child: Text(
              active ? 'Active' : "Inactive",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ))));
  }
}
