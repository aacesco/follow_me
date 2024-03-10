import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_constants.dart';
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

  final formKey = GlobalKey<FormState>();
  late DateTime start;

  CollectionReference eventsCollection =
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
}
