import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_constants.dart';
import '../constants/fields_constants.dart';
import '../constants/navigation_constants.dart';
import '../models/date.dart';
import '../models/event.dart';

/// Se l'evento è nuovo, deve proporre la data corrente intera
/// più prossima e aggiungere 2 ore al fine evento?
/// deve tenere in memoria le date che l'utente inserisce da 0,
/// verificando se l'evento sia ricorrente
///
/// se invece l'evento fosse già esistente, deve recuperare tutte le date,
/// elencarle e permettere di modificarle/cancellarle.
class DatesController extends GetxController {
  RxList<Date> dates = <Date>[].obs;
  RxString dateId = ''.obs;

  final GlobalKey formKey = GlobalKey<FormState>();
  late DateTime start;

  CollectionReference datesCollection =
      FirebaseFirestore.instance.collection(AppConstants.DATES);

  String buildDateTime() {
    DateTime currentTime = DateTime.now();
    DateTime nextHour = DateTime(currentTime.year, currentTime.month,
        currentTime.day, currentTime.hour + 1);
    return nextHour.toLocal().toString();
  }

  void defaultStart() {
    start = DateTime.now();
  }

  Future getDatesByEventId(String eventId) async {
    if (eventId.isNotEmpty) {
      QuerySnapshot results = await datesCollection
          .where(FieldsConstants.EVENT_ID, isEqualTo: eventId)
          .orderBy(FieldsConstants.START)
          .get();

      parseList(results);
    }
  }

  Future getDateById(String id) async {
    DocumentSnapshot document = await datesCollection.doc(id).get();

    Date item = Date.fromQuery(document);
    dates.clear();
    dates.add(item);
  }

  void parseList(QuerySnapshot<Object?> results) {
    dates.clear();

    for (DocumentSnapshot document in results.docs) {
      Date item = Date.fromQuery(document);
      dates.add(item);
    }
  }
}
