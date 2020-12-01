import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/event.dart';
import './repository.dart';

class FirestoreEventListRepository extends EventListRepository {
  final FirebaseFirestore _firestore;

  FirestoreEventListRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Event>> fetch() {
    return _firestore.collection("events").snapshots().map((snapshot){
      return snapshot.docs.map((docs) {
        return Event(
          id: docs.id,
          title: docs.data()["title"] ?? "",
          description: docs.data()["description"] ?? "",
          date: docs.data()["date"]?.toDate() ?? DateTime.utc(2020),
          imageUrl: docs.data()["image_url"] ?? "",
          user: null,
        );
      }).toList();
    });
    throw UnimplementedError();
  }

}
