import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/input_text.dart';
import '../constants/app_constants.dart';
import '../constants/navigation_constants.dart';
import '../models/event.dart';
import '../data/events_controller.dart';
import 'package:get/get.dart';

class EditEventPage extends StatelessWidget {
  final Event event;
  final bool isNew;

  EditEventPage(this.event, this.isNew, {super.key});

  final TextEditingController imageCtlr = TextEditingController();
  final TextEditingController titleCtlr = TextEditingController();
  final TextEditingController descriptionCtlr = TextEditingController();
  final TextEditingController categoryCtlr = TextEditingController();
  final TextEditingController locationCtlr = TextEditingController();
  final TextEditingController recurringCtlr = TextEditingController();
  final TextEditingController notesCtlr = TextEditingController();
  final TextEditingController audienceCtlr = TextEditingController();
  final TextEditingController typeCtlr = TextEditingController();
  final TextEditingController contactsCtlr = TextEditingController();
  final TextEditingController promoterCtlr = TextEditingController();
  final TextEditingController guideCtlr = TextEditingController();
  final TextEditingController websiteCtlr = TextEditingController();
  final TextEditingController attachmentsCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if(!isNew){
      imageCtlr.text = event.image;
      titleCtlr.text = event.title;
      descriptionCtlr.text = event.description;
      categoryCtlr.text = event.category;
      locationCtlr.text = event.location;
      recurringCtlr.text = event.recurring.toString();
      notesCtlr.text = event.notes ?? AppConstants.EMPTY;
      audienceCtlr.text = event.audience ?? AppConstants.EMPTY;
      typeCtlr.text = event.type ?? AppConstants.GENERIC;
      guideCtlr.text = event.guide ?? AppConstants.EMPTY;
      contactsCtlr.text = event.contacts ?? AppConstants.EMPTY;
      promoterCtlr.text = event.promoter ?? AppConstants.EMPTY;
      websiteCtlr.text = event.link ?? AppConstants.EMPTY;
      attachmentsCtlr.text = event.attachments ?? AppConstants.EMPTY;
    }

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.details)),
      floatingActionButton: FloatingActionButton(
        onPressed: saveEvent,
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputText(imageCtlr, AppLocalizations.of(context)!.image),
            InputText(titleCtlr, AppLocalizations.of(context)!.title),
            InputText(descriptionCtlr, AppLocalizations.of(context)!.description),
            InputText(categoryCtlr, AppLocalizations.of(context)!.category),
            InputText(locationCtlr, AppLocalizations.of(context)!.location),
            InputText(notesCtlr, AppLocalizations.of(context)!.notes),
          ],
        ),
      ),
    );
  }

  Future saveEvent() async {
    final eventsRepo = Get.put(EventsController());

    event.image = imageCtlr.text;
    event.title = titleCtlr.text;
    event.description = descriptionCtlr.text;
    event.category = categoryCtlr.text;
    event.location = locationCtlr.text;
    event.notes = notesCtlr.text;
    event.insertTime = isNew ? DateTime.now() : event.insertTime;
    event.insertUser = isNew ? 'Andrea' : event.insertUser;
    event.updateTime = DateTime.now();
    event.updateUser = 'Andrea';

    if(isNew){
      await eventsRepo.addEvent(event);
    } else {
      await eventsRepo.updateEvent(event);
    }

    await eventsRepo.getEventById(eventsRepo.eventId.value);

    Get.toNamed(NavigationConstants.EVENT_PAGE, arguments: eventsRepo.events[0]);
  }
}
