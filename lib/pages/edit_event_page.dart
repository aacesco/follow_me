import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/controllers/category_controller.dart';
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
  //todo in questo caso, devo usare get.put o solo la classe in sè? usare get.create?
  final ImagePickerController imageCtlr = Get.put(ImagePickerController());

  final CategoryController categoryCtlr = Get.put(CategoryController());

  final TextEditingController titleCtlr = TextEditingController();
  final TextEditingController descriptionCtlr = TextEditingController();
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

  /* String? audience;
  String? type;
  String? contacts;
  String? promoter;
  String? guide;
  String? link;
  int? likes; //parteciperò/ interessato
  List<String>? tags;*/

  @override
  Widget build(BuildContext context) {
    //categoryCtlr.changeCategory(AppConstants.SPIRITUAL);

    if (!isNew) {
      imageCtlr.imageUrl.value = event.image;
      titleCtlr.text = event.title;
      descriptionCtlr.text = event.description;
      categoryCtlr.selectedCategory.value = event.category;
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
              Text(AppLocalizations.of(context)!.category),
              CupertinoSegmentedControl<String>(
                  children: CategoryController.categories(context),
                  onValueChanged: (String category) {
                    categoryCtlr.changeCategory(category);
                  },
                  groupValue: categoryCtlr.selectedCategory.value),
              InputText(titleCtlr, AppLocalizations.of(context)!.title,
                  mandatory: true),
              InputText(
                  descriptionCtlr, AppLocalizations.of(context)!.description,
                  mandatory: true),
              InputText(locationCtlr, AppLocalizations.of(context)!.location,
                  mandatory: true),
              InputText(notesCtlr, AppLocalizations.of(context)!.notes),
              InputText(audienceCtlr, AppLocalizations.of(context)!.audience),
              InputText(typeCtlr, AppLocalizations.of(context)!.type),
              InputText(contactsCtlr, AppLocalizations.of(context)!.contacts),
              InputText(promoterCtlr, AppLocalizations.of(context)!.promoter),
              InputText(guideCtlr, AppLocalizations.of(context)!.guide),
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
    event.category = categoryCtlr.selectedCategory.value;
    event.location = locationCtlr.text;
    event.notes = notesCtlr.text;
    event.audience = audienceCtlr.text;
    event.type = typeCtlr.text;
    event.contacts = contactsCtlr.text;
    event.promoter = promoterCtlr.text;
    event.guide = guideCtlr.text;
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
