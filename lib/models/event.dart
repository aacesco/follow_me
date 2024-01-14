import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/app_constants.dart';
import '../constants/fields_constants.dart';

class Event{

  String? id;
  late String image; //url
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
      this.image,
      this.title,
      this.description,
      this.category,
      this.location,
      //this.dates,
      this.insertUser,
      this.insertTime,
      this.updateUser,
      this.updateTime
      );

  Event.fromQuery(DocumentSnapshot document){
    Map<String,dynamic> map = (document.data() as Map<String,dynamic>);

    id = document.id;
    image = document[FieldsConstants.IMAGE];
    title = document[FieldsConstants.TITLE];
    description = document[FieldsConstants.DESCRIPTION];
    category = document[FieldsConstants.CATEGORY];
    notes = map.containsKey(FieldsConstants.NOTES) ? document[FieldsConstants.NOTES] : AppConstants.EMPTY;
    location = document[FieldsConstants.LOCATION];
    //dates = map[FieldsConstants.DATES];
    insertUser = document[FieldsConstants.INSERT_USER] ?? AppConstants.EMPTY;
    insertTime = document[FieldsConstants.INSERT_TIME].toString();
    updateUser = document[FieldsConstants.UPDATE_USER] ?? AppConstants.EMPTY;
    updateTime = document[FieldsConstants.UPDATE_TIME].toString();
  }

  Map<String, dynamic> toMap(){
    return {
      FieldsConstants.IMAGE : image,
      FieldsConstants.TITLE : title,
      FieldsConstants.DESCRIPTION : description,
      FieldsConstants.CATEGORY : category,
      FieldsConstants.LOCATION : location,
      FieldsConstants.NOTES : notes,
      //FieldsConstants.DATES : dates,
      FieldsConstants.INSERT_TIME : insertTime,
      FieldsConstants.INSERT_USER : insertUser,
      FieldsConstants.UPDATE_TIME : updateTime,
      FieldsConstants.UPDATE_USER: updateUser,
    };
  }
}