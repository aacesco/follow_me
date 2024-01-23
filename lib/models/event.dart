import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/app_constants.dart';
import '../constants/fields_constants.dart';
import 'markers.dart';

class Event extends Markers{

  String? id;
  late String image;
  late String title;
  late String description;
  late String category;
  late String location;
  double? latitude;
  double? longitude; // usare geopoint//position /chiedere posizione dell'utente
  bool? recurring; //frequency, every week, every month..
  String? notes;
  String? audience;
  String? type;
  String? contacts;
  String? promoter;
  String? guide;
  String? link;
  int? likes;//parteciperò/ interessato
  List<String>? tags;

  List<String>? favorite; //metterlo nell'anagrafica dell'utente (tab a parte), lista di ID
  String? attachments; //cloud storage, limite dimensione massima, entità esterna,
  // creare cartella con id evento o ID come prefisso del file

  Event(
      this.image,
      this.title,
      this.description,
      this.category,
      this.location,
      super.insertUser,
      super.insertTime,
      super.updateUser,
      super.updateTime
      );

  Event.fromQuery(DocumentSnapshot document) : super(
    document[FieldsConstants.INSERT_USER] ?? AppConstants.EMPTY,
    (document[FieldsConstants.INSERT_TIME] as Timestamp).toDate(),
    document[FieldsConstants.UPDATE_USER] ?? AppConstants.EMPTY,
    (document[FieldsConstants.UPDATE_TIME] as Timestamp).toDate(),
  ){
    Map<String,dynamic> map = (document.data() as Map<String,dynamic>);

    id = document.id;
    image = document[FieldsConstants.IMAGE];
    title = document[FieldsConstants.TITLE];
    description = document[FieldsConstants.DESCRIPTION];
    category = document[FieldsConstants.CATEGORY];
    notes = map.containsKey(FieldsConstants.NOTES) ? document[FieldsConstants.NOTES] : AppConstants.EMPTY;
    location = document[FieldsConstants.LOCATION];
  }

  Map<String, dynamic> toMap(){
    return {
      FieldsConstants.IMAGE : image,
      FieldsConstants.TITLE : title,
      FieldsConstants.DESCRIPTION : description,
      FieldsConstants.CATEGORY : category,
      FieldsConstants.LOCATION : location,
      FieldsConstants.NOTES : notes,
      FieldsConstants.INSERT_TIME : insertTime,
      FieldsConstants.INSERT_USER : insertUser,
      FieldsConstants.UPDATE_TIME : updateTime,
      FieldsConstants.UPDATE_USER: updateUser,
    };
  }
}