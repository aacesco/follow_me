import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/bottomnavbar.dart';
import '../components/input_image.dart';
import '../components/input_text.dart';
import '../constants/app_constants.dart';
import '../constants/navigation_constants.dart';
import '../controllers/image_picker_controller.dart';
import '../models/event.dart';
import '../controllers/events_controller.dart';
import 'package:get/get.dart';

class EditEventPage extends StatelessWidget {
  final Event event;
  final bool isNew;

  EditEventPage(this.event, this.isNew, {super.key});
  //todo se avessi più immagini distinte da mostrare, dovrei usare solo ImagePickerController() ?
  final ImagePickerController imageCtlr = Get.put(ImagePickerController());
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
    if (!isNew) {
      imageCtlr.imageUrl.value = event.image;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              InputImage(imageCtlr, AppLocalizations.of(context)!.image),
              InputText(titleCtlr, AppLocalizations.of(context)!.title),
              InputText(
                  descriptionCtlr, AppLocalizations.of(context)!.description),
              InputText(categoryCtlr, AppLocalizations.of(context)!.category),
              InputText(locationCtlr, AppLocalizations.of(context)!.location),
              InputText(notesCtlr, AppLocalizations.of(context)!.notes),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: saveEvent,
          child: const Icon(Icons.save),
        ),
        bottomNavigationBar: const BottomNavBar());
  }

  Future saveEvent() async {
    EventsController eventsRepo = Get.find();

    event.image = imageCtlr.imageUrl.value;
    event.title = titleCtlr.text;
    event.description = descriptionCtlr.text;
    event.category = categoryCtlr.text;
    event.location = locationCtlr.text;
    event.notes = notesCtlr.text;
    event.insertTime = isNew ? DateTime.now() : event.insertTime;
    event.insertUser = isNew ? 'Andrea' : event.insertUser;
    event.updateTime = DateTime.now();
    event.updateUser = 'Andrea';

    if (isNew) {
      await eventsRepo.addEvent(event);
    } else {
      await eventsRepo.updateEvent(event);
    }

    await eventsRepo.getEventById(eventsRepo.eventId.value);

    Get.toNamed(NavigationConstants.EVENT_PAGE,
        arguments: {'event': eventsRepo.events[0]});
  }
}
