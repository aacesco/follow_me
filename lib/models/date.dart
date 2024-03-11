import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/app_constants.dart';
import '../constants/fields_constants.dart';
import 'markers.dart';

class Date extends Markers {
  String? id;
  late DateTime start;
  DateTime? end;
  String? eventId;
  String? notes;

  Date(this.start, super.insertUser, super.insertTime, super.updateUser,
      super.updateTime);

  Date.eventId(this.start, this.eventId, super.insertUser, super.insertTime,
      super.updateUser, super.updateTime);

  Date.fromQuery(DocumentSnapshot document)
      : super(
          document[FieldsConstants.INSERT_USER] ?? AppConstants.EMPTY,
          (document[FieldsConstants.INSERT_TIME] as Timestamp).toDate(),
          document[FieldsConstants.UPDATE_USER] ?? AppConstants.EMPTY,
          (document[FieldsConstants.UPDATE_TIME] as Timestamp).toDate(),
        ) {
    Map<String, dynamic> map = (document.data() as Map<String, dynamic>);

    id = document.id;
    start = (document[FieldsConstants.START] as Timestamp).toDate();
    end = map.containsKey(FieldsConstants.END)
        ? (document[FieldsConstants.END] as Timestamp).toDate()
        : null;
    eventId = document[FieldsConstants.EVENT_ID];
    notes = map.containsKey(FieldsConstants.NOTES)
        ? document[FieldsConstants.NOTES]
        : AppConstants.EMPTY;
  }

  Map<String, dynamic> toMap() {
    return {
      FieldsConstants.START: start,
      FieldsConstants.END: end,
      FieldsConstants.EVENT_ID: eventId,
      FieldsConstants.NOTES: notes,
      FieldsConstants.INSERT_TIME: insertTime,
      FieldsConstants.INSERT_USER: insertUser,
      FieldsConstants.UPDATE_TIME: updateTime,
      FieldsConstants.UPDATE_USER: updateUser,
    };
  }
}
