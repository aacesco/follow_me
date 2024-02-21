import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/utils/enum_helper.dart';
import '../components/bottomnavbar.dart';
import '../components/input_image.dart';
import '../components/input_text.dart';
import '../constants/app_constants.dart';
import '../constants/app_enums.dart';
import '../constants/navigation_constants.dart';
import '../controllers/image_picker_controller.dart';
import '../models/event.dart';
import '../controllers/events_controller.dart';
import 'package:get/get.dart';

class EditEventPage extends StatefulWidget {
  final Event event;
  final bool isNew;

  EditEventPage(this.event, this.isNew, {super.key});

  final ImagePickerController imageCtlr = Get.put(ImagePickerController());

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

  /*
  int? likes; //parteciperò/ interessato
  List<String>? tags;*/

  @override
  State<EditEventPage> createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  //Categories currentCategory = Categories.spiritual;

  @override
  Widget build(BuildContext context) {
    if (!widget.isNew) {
      widget.imageCtlr.imageUrl.value = widget.event.image;
      widget.titleCtlr.text = widget.event.title;
      widget.descriptionCtlr.text = widget.event.description;
      //currentCategory = EnumHelper.fromName( Categories.values, widget.event.category, Categories.spiritual);
      widget.locationCtlr.text = widget.event.location;
      widget.recurringCtlr.text = widget.event.recurring.toString();
      widget.notesCtlr.text = widget.event.notes ?? AppConstants.EMPTY;
      widget.audienceCtlr.text = widget.event.audience ?? AppConstants.EMPTY;
      widget.typeCtlr.text = widget.event.type ?? AppConstants.GENERIC;
      widget.guideCtlr.text = widget.event.guide ?? AppConstants.EMPTY;
      widget.contactsCtlr.text = widget.event.contacts ?? AppConstants.EMPTY;
      widget.promoterCtlr.text = widget.event.promoter ?? AppConstants.EMPTY;
      widget.websiteCtlr.text = widget.event.link ?? AppConstants.EMPTY;
      widget.attachmentsCtlr.text =
          widget.event.attachments ?? AppConstants.EMPTY;
    }

    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.details)),
        body: ListView(
          children: [
            InputImage(widget.imageCtlr, AppLocalizations.of(context)!.image),
            Text(AppLocalizations.of(context)!.category),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: SegmentedButton(
                  segments: AppConstants.categoryList(context),
                  selected: <Categories>{
                    EnumHelper.fromName(Categories.values,
                        widget.event.category, Categories.spiritual)
                  },
                  onSelectionChanged: (Set<Categories> category) {
                    setState(() {
                      print(
                          'current cat: ${widget.event.category}, new categoria; ${category.first.name}');
                      //todo ha senso o è meglio usare una variabile?
                      widget.event.category = category.first.name;
                      //currentCategory = category.first;
                    });
                  },
                )),
            InputText(widget.titleCtlr, AppLocalizations.of(context)!.title,
                mandatory: true),
            InputText(widget.descriptionCtlr,
                AppLocalizations.of(context)!.description,
                mandatory: true),
            InputText(
                widget.locationCtlr, AppLocalizations.of(context)!.location,
                mandatory: true),
            InputText(widget.notesCtlr, AppLocalizations.of(context)!.notes),
            InputText(
                widget.audienceCtlr, AppLocalizations.of(context)!.audience),
            InputText(widget.typeCtlr, AppLocalizations.of(context)!.type),
            InputText(
                widget.contactsCtlr, AppLocalizations.of(context)!.contacts),
            InputText(
                widget.promoterCtlr, AppLocalizations.of(context)!.promoter),
            InputText(widget.guideCtlr, AppLocalizations.of(context)!.guide),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: saveEvent,
          child: const Icon(Icons.save),
        ),
        bottomNavigationBar: const BottomNavBar());
  }

  Future saveEvent() async {
    EventsController eventsRepo = Get.find();

    widget.event.image = widget.imageCtlr.imageUrl.value;
    widget.event.title = widget.titleCtlr.text;
    widget.event.description = widget.descriptionCtlr.text;
    //widget.event.category = currentCategory.name;
    widget.event.location = widget.locationCtlr.text;
    widget.event.notes = widget.notesCtlr.text;
    widget.event.audience = widget.audienceCtlr.text;
    widget.event.type = widget.typeCtlr.text;
    widget.event.contacts = widget.contactsCtlr.text;
    widget.event.promoter = widget.promoterCtlr.text;
    widget.event.guide = widget.guideCtlr.text;
    widget.event.insertTime =
        widget.isNew ? DateTime.now() : widget.event.insertTime;
    widget.event.insertUser = widget.isNew ? 'Andrea' : widget.event.insertUser;
    widget.event.updateTime = DateTime.now();
    widget.event.updateUser = 'Andrea';

    if (widget.isNew) {
      await eventsRepo.addEvent(widget.event);
    } else {
      await eventsRepo.updateEvent(widget.event);
    }

    await eventsRepo.getEventById(eventsRepo.eventId.value);

    Get.toNamed(NavigationConstants.EVENT_PAGE,
        arguments: {'event': eventsRepo.events[0]});
  }
}
