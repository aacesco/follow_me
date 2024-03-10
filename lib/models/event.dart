import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/app_constants.dart';
import '../constants/fields_constants.dart';
import 'markers.dart';

class Event extends Markers {
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
  String? website;
  String? whatsapp;
  String? telegram;
  int? likes; //parteciperò/ interessato
  List<dynamic>? tags;
  //metterlo nell'anagrafica dell'utente (tab a parte), lista di ID
  List<dynamic>? favorite;
  //cloud storage, limite dimensione massima, entità esterna,
  // creare cartella con id evento o ID come prefisso del file
  String? attachments;

  Event(this.image, this.title, this.description, this.category, this.location,
      super.insertUser, super.insertTime, super.updateUser, super.updateTime);

  Event.fromQuery(DocumentSnapshot document)
      : super(
          document[FieldsConstants.INSERT_USER] ?? AppConstants.EMPTY,
          (document[FieldsConstants.INSERT_TIME] as Timestamp).toDate(),
          document[FieldsConstants.UPDATE_USER] ?? AppConstants.EMPTY,
          (document[FieldsConstants.UPDATE_TIME] as Timestamp).toDate(),
        ) {
    Map<String, dynamic> map = (document.data() as Map<String, dynamic>);

    id = document.id;
    image = document[FieldsConstants.IMAGE];
    title = document[FieldsConstants.TITLE];
    description = document[FieldsConstants.DESCRIPTION];
    category = document[FieldsConstants.CATEGORY];
    location = document[FieldsConstants.LOCATION];
    notes = map.containsKey(FieldsConstants.NOTES)
        ? document[FieldsConstants.NOTES]
        : AppConstants.EMPTY;
    audience = map.containsKey(FieldsConstants.AUDIENCE)
        ? document[FieldsConstants.AUDIENCE]
        : AppConstants.EMPTY;
    type = map.containsKey(FieldsConstants.TYPE)
        ? document[FieldsConstants.TYPE]
        : AppConstants.EMPTY;
    contacts = map.containsKey(FieldsConstants.CONTACTS)
        ? document[FieldsConstants.CONTACTS]
        : AppConstants.EMPTY;
    promoter = map.containsKey(FieldsConstants.PROMOTER)
        ? document[FieldsConstants.PROMOTER]
        : AppConstants.EMPTY;
    guide = map.containsKey(FieldsConstants.GUIDE)
        ? document[FieldsConstants.GUIDE]
        : AppConstants.EMPTY;
    website = map.containsKey(FieldsConstants.WEBSITE)
        ? document[FieldsConstants.WEBSITE]
        : AppConstants.EMPTY;
    whatsapp = map.containsKey(FieldsConstants.WHATSAPP)
        ? document[FieldsConstants.WHATSAPP]
        : AppConstants.EMPTY;
    telegram = map.containsKey(FieldsConstants.TELEGRAM)
        ? document[FieldsConstants.TELEGRAM]
        : AppConstants.EMPTY;
    likes = map.containsKey(FieldsConstants.LIKES)
        ? document[FieldsConstants.LIKES]
        : 0;
    tags = map.containsKey(FieldsConstants.TAGS)
        ? map[FieldsConstants.TAGS].map((dynamic item) => item.toString()).toList()
        : <String>[];
    favorite = map.containsKey(FieldsConstants.FAVORITE)
        ? document[FieldsConstants.FAVORITE].map((dynamic item) => item.toString()).toList()
        : <String>[];
    attachments = map.containsKey(FieldsConstants.ATTACHMENTS)
        ? document[FieldsConstants.ATTACHMENTS]
        : AppConstants.EMPTY;
    latitude = map.containsKey(FieldsConstants.LATITUDE)
        ? document[FieldsConstants.LATITUDE]
        : 0.0;
    longitude = map.containsKey(FieldsConstants.LONGITUDE)
        ? document[FieldsConstants.LONGITUDE]
        : 0.0;
    recurring = map.containsKey(FieldsConstants.RECURRING)
        ? document[FieldsConstants.RECURRING]
        : false;
    /*dates = map.containsKey(FieldsConstants.DATES)
        ? document[FieldsConstants.DATES]
        : AppConstants.EMPTY;*/
  }

  Map<String, dynamic> toMap() {
    return {
      FieldsConstants.IMAGE: image,
      FieldsConstants.TITLE: title,
      FieldsConstants.DESCRIPTION: description,
      FieldsConstants.CATEGORY: category,
      FieldsConstants.LOCATION: location,
      FieldsConstants.NOTES: notes,
      FieldsConstants.AUDIENCE: audience,
      FieldsConstants.TYPE: type,
      FieldsConstants.CONTACTS: contacts,
      FieldsConstants.PROMOTER: promoter,
      FieldsConstants.GUIDE: guide,
      FieldsConstants.WEBSITE: website,
      FieldsConstants.WHATSAPP: whatsapp,
      FieldsConstants.TELEGRAM: telegram,
      FieldsConstants.LIKES: likes,
      FieldsConstants.TAGS: tags,
      FieldsConstants.FAVORITE: favorite,
      FieldsConstants.ATTACHMENTS: attachments,
      FieldsConstants.LATITUDE: latitude,
      FieldsConstants.LONGITUDE: longitude,
      FieldsConstants.RECURRING: recurring,
      FieldsConstants.INSERT_TIME: insertTime,
      FieldsConstants.INSERT_USER: insertUser,
      FieldsConstants.UPDATE_TIME: updateTime,
      FieldsConstants.UPDATE_USER: updateUser,

      /*FieldsConstants.DATES : dates,

        ? document[FieldsConstants.DATES]
        : AppConstants.EMPTY;*/
    };
  }
}
