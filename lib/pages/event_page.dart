import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/constants/navigation_constants.dart';
import 'package:follow_me/pages/events_list.dart';
import 'package:get/get.dart';
import '../components/cover_image.dart';
import '../components/paragraph.dart';
import '../constants/app_constants.dart';
import '../models/event.dart';

class EventPage extends StatelessWidget {
  final Event event;

  const EventPage(this.event, {super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.details),
        leading: IconButton(
            onPressed: () {
              Get.to(EventsList(event.category));
            },
            icon: const Icon(Icons.arrow_back)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: editEvent,
        child: const Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoverImage(event: event),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 2, bottom: 12),
                          child:
                          Text(event.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  height: 1.3,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)
                          )
                      ),
                      Paragraph(AppLocalizations.of(context)!.description, event.description),
                      Paragraph(AppLocalizations.of(context)!.location, event.location, icon: const Icon(Icons.pin_drop_outlined)),
                      Paragraph(AppLocalizations.of(context)!.category, event.category),
                      Paragraph(AppLocalizations.of(context)!.notes, event.notes?? AppConstants.EMPTY),
                    ]
                )
            )
          ],
        ),
      ),
    );
  }

  Future editEvent() async {
    Get.toNamed(NavigationConstants.EDIT_EVENT_PAGE, arguments: {'event': event, 'isNew': false});
  }
}
