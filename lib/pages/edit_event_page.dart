import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants/app_constants.dart';
import '../models/event.dart';
import '../data/events_repo.dart';
import 'package:get/get.dart';

class EditEventPage extends StatefulWidget {
  final Event event;
  final bool isNew;

  const EditEventPage(this.event, this.isNew, {super.key});

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  final TextEditingController imageCtlr = TextEditingController();
  final TextEditingController titleCtlr = TextEditingController();
  final TextEditingController descriptionCtlr = TextEditingController();
  final TextEditingController categoryCtlr = TextEditingController();
  final TextEditingController locationCtlr = TextEditingController();
  final TextEditingController datesCtlr = TextEditingController();
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
  void initState() {
    if(!widget.isNew){
      imageCtlr.text = widget.event.image;
      titleCtlr.text = widget.event.title;
      descriptionCtlr.text = widget.event.description;
      categoryCtlr.text = widget.event.category;
      locationCtlr.text = widget.event.location;
      // datesCtlr.text = widget.article.dates[0].toString();
      recurringCtlr.text = widget.event.recurring.toString();
      notesCtlr.text = widget.event.notes ?? AppConstants.EMPTY;
      audienceCtlr.text = widget.event.audience ?? AppConstants.EMPTY;
      typeCtlr.text = widget.event.type ?? AppConstants.GENERIC;
      guideCtlr.text = widget.event.guide ?? AppConstants.EMPTY;
      contactsCtlr.text = widget.event.contacts ?? AppConstants.EMPTY;
      promoterCtlr.text = widget.event.promoter ?? AppConstants.EMPTY;
      websiteCtlr.text = widget.event.link ?? AppConstants.EMPTY;
      attachmentsCtlr.text = widget.event.attachments ?? AppConstants.EMPTY;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

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
    final eventsRepo = Get.put(EventsRepo());

    widget.event.image = imageCtlr.text;
    widget.event.title = titleCtlr.text;
    widget.event.description = descriptionCtlr.text;
    widget.event.category = categoryCtlr.text;
    widget.event.location = locationCtlr.text;
    widget.event.notes = notesCtlr.text;
    widget.event.insertTime = widget.isNew ? DateTime.now() : widget.event.insertTime;
    widget.event.insertUser = widget.isNew ? 'Andrea' : widget.event.insertUser;
    widget.event.updateTime = DateTime.now();
    widget.event.updateUser = 'Andrea';

    String id;
    if(widget.isNew){
      id = await eventsRepo.AddSpiritualEvent(widget.event);
    } else {
      id = await eventsRepo.UpdateSpiritualEvent(widget.event);
    }

    Event currentEvent = await eventsRepo.GetSpiritualEventById(id);
    Get.toNamed("/event_page", arguments: currentEvent);
  }
}

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const InputText(this.controller, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: label),
      ),
    );
  }
}
