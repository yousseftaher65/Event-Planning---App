import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_pojo/ui/model/event_model.dart';

class FirebaseUtils {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<EventModel> getEvents() {
    return firestore
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
            fromFirestore: (snapshot, options) =>
                EventModel.fromFirestore(snapshot.data()!),
            toFirestore: (event, _) => event.toFirestore());
  }

  static Future<void> addEvent(EventModel event) async {
    var collection = getEvents().doc().id;
    event.id = collection;
    return getEvents().doc(collection).set(event);
  }
}
