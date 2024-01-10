import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/fields_constants.dart';

class Event{

  String? id;
  String? image; //url
  late String title;
  late String description;
  late String category;
  late String location;
  List<String>? dates; //discuss later
  bool? recurring; //frequency, every week, every month..
  String? notes;
  String? audience;
  String? type;
  String? contacts;
  String? promoter;
  String? guide;
  String? link;
  String? attachments;
  int? likes;

  late String insertUser;
  late String insertTime;
  late String updateUser;
  late String updateTime;

  Event(
      this.title,
      this.description,
      this.category,
      this.location,
      //this.dates,
      this.insertUser,
      this.insertTime,
      this.updateUser,
      this.updateTime);

   Event.fromQuery(DocumentSnapshot map){
    id = map.id;
    title = map[FieldsConstants.TITLE];
    description = map[FieldsConstants.DESCRIPTION];
    category = map[FieldsConstants.CATEGORY];
    notes = map[FieldsConstants.NOTES];
    location = map[FieldsConstants.LOCATION];
    image = map[FieldsConstants.IMAGE];
    //dates = map[FieldsConstants.DATES];
    insertUser = map[FieldsConstants.INSERT_USER];
    //insertTime = map[FieldsConstants.INSERT_TIME];
    updateUser = map[FieldsConstants.UPDATE_USER];
    //updateTime = map[FieldsConstants.UPDATE_TIME];
  }

  Event.fromMap(Map<String, dynamic> map){
    id = map[FieldsConstants.ID];
    title = map[FieldsConstants.TITLE];
    description = map[FieldsConstants.DESCRIPTION];
    category = map[FieldsConstants.CATEGORY];
    //dates = map[FieldsConstants.DATES];
    insertUser = map[FieldsConstants.INSERT_USER];
    //insertTime = map[FieldsConstants.INSERT_TIME];
    updateUser = map[FieldsConstants.UPDATE_USER];
    //updateTime = map[FieldsConstants.UPDATE_TIME];
  }

  Map<String, dynamic> toMap(){
    return {
      FieldsConstants.ID : id,
      FieldsConstants.TITLE : title,
      FieldsConstants.DESCRIPTION : description,
      FieldsConstants.CATEGORY : notes,
      //FieldsConstants.DATES : dates,
      FieldsConstants.INSERT_TIME : insertTime,
      FieldsConstants.INSERT_USER : insertUser,
      FieldsConstants.LOCATION : location,
      FieldsConstants.UPDATE_TIME : updateTime,
      FieldsConstants.UPDATE_USER: updateUser,
    };
  }
}