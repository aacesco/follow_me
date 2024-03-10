import 'markers.dart';

class Date extends Markers {
  String? id;
  late String eventId;
  late List<DateTime>? dates;

  Date(this.eventId, this.dates, super.insertUser, super.insertTime,
      super.updateUser, super.updateTime);
}
