
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import '../../model/event.dart';



abstract class EventListState extends Equatable {
  EventListState();

  @override
  List<Object> get props => [];
}


class EventListEmpty extends EventListState {
  @override
  String toString() {
    return "EventListEmpty";
  }
}

class EventListInProgress extends EventListState {
  @override
  String toString() {
    return "EventListInProgress";
  }
}

class EventListSuccess extends EventListState {
  final Stream<List<Event>> eventList;

  EventListSuccess({@required this.eventList})
      : assert( eventList != null)
  ;

  @override
  List<Object> get props => [eventList];

  @override
  String toString() {
    return "EventListSuccess";
  }
}

class EventListFailure extends EventListState {
  final Error error;

  EventListFailure({@required this.error})
      : assert(error != null);

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return "EventListFailure";
  }
}
