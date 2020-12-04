
import '../../model/event.dart';

abstract class EventListRepository {
  Stream<List<Event>> fetch();
}