import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:follow_me/constants/app_constants.dart';
import 'package:get/get.dart';
import '../models/event.dart';
import '../constants/fields_constants.dart';

class EventsRepo extends GetxController{
  static EventsRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<Event>> GetSpiritualEvents() async {
    CollectionReference spiritualEvents = _db.collection(AppConstants.SPIRITUAL_EVENTS);
    QuerySnapshot results = await spiritualEvents.orderBy(FieldsConstants.TITLE).get();

    List<Event> list = <Event>[];

    results.docs.forEach((document) {
      Event item = Event.fromQuery(document);
      list.add(item);
    });

    return list;
  }

}