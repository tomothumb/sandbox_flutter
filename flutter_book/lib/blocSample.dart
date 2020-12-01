import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc.dart';


class BlocSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterBloc(),
        child: BlocSampleChildScreen(),
      );
  }
}

class BlocSampleChildScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    debugPrint('BLoC root is built');

    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Sample Counter'),
      ),
      body: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return Column(
              children: <Widget>[
                Text('TEST'),
                Text('$count', style: TextStyle(fontSize: 24.0)),
              ],
            );
          }
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child:FloatingActionButton(
              heroTag: "hero_plus",
              onPressed: () {
                counterBloc.add(CounterEvent.increment);
              },
              tooltip: "Increment",
              child: Text('Plus'),
            )
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child:FloatingActionButton(
                heroTag: "hero_minus",
                onPressed: () {
                  counterBloc.add(CounterEvent.decrement);
                },
                tooltip: "Decrement",
                child: Text('Minus'),
              )
          )
        ],
      ),
      backgroundColor: Colors.white,

    );
  }
}
