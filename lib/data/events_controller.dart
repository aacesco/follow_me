import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:follow_me/constants/app_constants.dart';
import 'package:get/get.dart';
import '../models/event.dart';
import '../constants/fields_constants.dart';

class EventsController extends GetxController{

  RxList<Event> events = <Event>[].obs;
  RxString eventId = ''.obs;

  CollectionReference eventsCollection = FirebaseFirestore.instance.collection(AppConstants.EVENTS);

  Future addEvent(Event event) async {
    DocumentReference res = await eventsCollection.add(event.toMap());
    eventId.value = res.id;
  }

  Future getEventById(String id) async {
    DocumentSnapshot document = await eventsCollection.doc(id).get();
    Event item = Event.fromQuery(document);
    events.clear();
    events.add(item);
  }

  Future getEvents() async {
    searchEvents('');
  }

  Future searchEvents(String searchKey) async {
    QuerySnapshot results = await eventsCollection
        .where(FieldsConstants.TITLE, isGreaterThanOrEqualTo: searchKey)
        .where(FieldsConstants.TITLE, isLessThan: '${searchKey}z')
        .orderBy(FieldsConstants.TITLE)
        .get();

    parseList(results);
  }

  Future updateEvent(Event event) async {
    await eventsCollection.doc(event.id).update(event.toMap());
    eventId.value = event.id ?? '';
  }

  Future deleteEvent(Event event) async {
    await eventsCollection.doc(event.id).delete();
  }

  void parseList(QuerySnapshot<Object?> results) {
    events.clear();

    for (DocumentSnapshot document in results.docs) {
      Event item = Event.fromQuery(document);
      events.add(item);
    }
  }
}