import 'package:flutter/material.dart';
import 'package:follow_me/constants/navigation_constants.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../controllers/dates_controller.dart';
import '../models/date.dart';
import '../models/event.dart';

class DateTile extends StatelessWidget {
  final Date? date;
  final Event? event;

  const DateTile({super.key, this.date, this.event});

  @override
  Widget build(BuildContext context) {
    DatesController datesController = Get.find();

    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: Card(
              shadowColor: const Color(0xFF232222),
              elevation: 10,
              color: const Color(0xFFF9F9F9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: buildCard(context)),
        ));
  }

  onTap() {
    //todo verificare se sia attiva
    //Get.toNamed(NavigationConstants.EVENT_PAGE, arguments: {'event': widget.date});
  }

  buildCard(BuildContext context) {
    if (date != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${AppLocalizations.of(context)!.start} Mar 23 2024 ore 10:30"),
              Text(
                  "${AppLocalizations.of(context)!.end} Mar 23 2024 ore 10:30"),
              Text("Note: rgehrj vrehuiv veruvvr"),
            ],
          ),
          IconButton(icon: const Icon(Icons.edit_calendar), onPressed: () {}),
        ],
      );
    } else {
      return Text("nessuna data : ");
    }
  }
}
