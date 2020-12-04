import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './state.dart';
import './event.dart';
import './repository.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  final EventListRepository _eventListRepository;

  EventListBloc({@required EventListRepository eventListRepository})
      : assert(eventListRepository != null),
        _eventListRepository = eventListRepository,
      super(EventListEmpty())
  ;

  EventListState get initialState => EventListEmpty();

  @override
  Stream<EventListState> mapEventToState(EventListEvent event) async* {
    if( event is EventListLoad) {
      yield* _mapEventToState();
    }
  }

  Stream<EventListState> _mapEventToState() async* {
    yield EventListInProgress();
    try {
      yield EventListSuccess(eventList: _eventListRepository.fetch());
    } catch (_){
      yield EventListFailure(error: _);
    }
  }
}
