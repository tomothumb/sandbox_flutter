
import 'package:equatable/equatable.dart';


abstract class EventListEvent extends Equatable {
  EventListEvent();

  @override
  List<Object> get props => [];
}


class EventListLoad extends EventListEvent {
  @override
  String toString() {
    return "EventListLoad";
  }
}
