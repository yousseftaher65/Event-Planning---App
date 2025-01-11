import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_pojo/ui/model/event_model.dart';

class FirebaseUtils {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<EventModel> getEventsCollection() {
    return firestore
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
            fromFirestore: (snapshot, options) =>
                EventModel.fromFirestore(snapshot.data()!),
            toFirestore: (event, _) => event.toFirestore());
  }
  static Future<void> addEvent(EventModel event) async {
    var collection = getEventsCollection().doc().id;
    event.id = collection;
    return getEventsCollection().doc(collection).set(event);
  }
  static Stream<QuerySnapshot<EventModel>> getEvent() {
    var collection = getEventsCollection().orderBy('date', descending: false).snapshots();
    return collection;
  }
   static Future<void> deleteEvent(String id) async {
    var collection = getEventsCollection().doc(id).delete();
    return collection;
  }
   static Future<void> updateEvent(EventModel event) async {
    var collection = getEventsCollection().doc(event.id).update(event.toFirestore());
    return collection; 
  }
}
