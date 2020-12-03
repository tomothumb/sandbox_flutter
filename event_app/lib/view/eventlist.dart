import 'package:event_app/bloc/event_list/event.dart';
import 'package:event_app/bloc/event_list/state.dart';
import 'package:event_app/model/event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/event_list/bloc.dart';
import '../bloc/event_list/repository_firestore.dart';

class EventListScreen extends StatelessWidget {

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  EventListScreen({Key key,  this.analytics, this.observer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eventListBloc = BlocProvider.of<EventListBloc>(context);
    // final eventListBloc = EventListBloc(eventListRepository: FirestoreEventListRepository());
    eventListBloc.add(EventListLoad());

    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
      ),
      body: BlocBuilder<EventListBloc, EventListState>(
        // bloc: eventListBloc,
        builder: (context, state) {
          if(state is EventListInProgress){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is EventListSuccess){
            return StreamBuilder(
              stream: state.eventList,
              builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {

                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError){
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Failer')
                      ],
                    )
                  );
                }

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final event = snapshot.data[index];
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ListTile(
                            title: Text(event.title, style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text(event.date.toIso8601String()),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Image.network(event.imageUrl, fit: BoxFit.none, height: 128,)
                              )
                            ],
                          ),
                          Text(event.description)
                        ],
                      )
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              }
            );
          }

          if(state is EventListFailure){
            return Center(
              child: Text("Failure"),
            );
          }

          return Container();

        }
      )

    );
  }
}
