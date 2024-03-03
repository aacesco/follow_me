import 'package:get/get.dart';
import '../constants/navigation_constants.dart';
import '../models/event.dart';

/// Se l'evento è nuovo, deve proporre la data corrente intera
/// più prossima e aggiungere 2 ore al fine evento?
/// deve tenere in memoria le date che l'utente inserisce da 0,
/// verificando se l'evento sia ricorrente
///
/// se invece l'evento fosse già esistente, deve recuperare tutte le date,
/// elencarle e permettere di modificarle/cancellarle.
class DatesController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void manageDates(String event) async {


  }


}
