import 'markers.dart';

class Dates extends Markers {
  String? id;
  late String eventId;
  late List<DateTime>? dates;

  Dates(this.eventId, this.dates, super.insertUser, super.insertTime,
      super.updateUser, super.updateTime);
}
