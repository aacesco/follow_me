import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:follow_me/constants/app_constants.dart';
import 'package:get/get.dart';
import '../models/event.dart';
import '../constants/fields_constants.dart';

class EventsRepo extends GetxController{
  CollectionReference spiritualEvents = FirebaseFirestore.instance.collection(AppConstants.SPIRITUAL_EVENTS);

  Future AddSpiritualEvent(Event event) async {
    DocumentReference res = await spiritualEvents.add(event.toMap());
    return res.id;
  }

  Future<Event> GetSpiritualEventById(String id) async {
    DocumentSnapshot document = await spiritualEvents.doc(id).get();
    Event item = Event.fromQuery(document);
    return item;
  }

  Future<List<Event>> GetSpiritualEvents() async {
    return SearchSpiritualEvents('');
  }

  Future<List<Event>> SearchSpiritualEvents(String searchKey) async {
    QuerySnapshot results = await spiritualEvents
        .where(FieldsConstants.TITLE, isGreaterThanOrEqualTo: searchKey)
        .where(FieldsConstants.TITLE, isLessThan: '${searchKey}z')
        .orderBy(FieldsConstants.TITLE)
        .get();

    return parseList(results);
  }

  Future UpdateSpiritualEvent(Event event) async {
    await spiritualEvents.doc(event.id).update(event.toMap());
    return event.id;
  }

  DeleteSpiritualEvent(Event event) async {
    await spiritualEvents.doc(event.id).delete();
  }

  List<Event> parseList(QuerySnapshot<Object?> results) {
    List<Event> list = <Event>[];

    for (DocumentSnapshot document in results.docs) {
      Event item = Event.fromQuery(document);
      list.add(item);
    }

    return list;
  }
}