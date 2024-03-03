import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/components/dates/input_dates.dart';
import 'package:follow_me/components/input_select.dart';
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

class DatesManager extends StatelessWidget {
  final String eventId;

  DatesManager(this.eventId, {super.key});

  //final InputDatePickerFormField start
  final TextEditingController telegramCtlr = TextEditingController();
  final TextEditingController tagsCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (eventId.isBlank ?? true) {

     // telegramCtlr.text = eventId.telegram ?? AppConstants.EMPTY;
      //websiteCtlr.text = eventId.website ?? AppConstants.EMPTY;
    }

    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.details)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputDatePickerFormField(
                fieldLabelText: 'Data di inizio',
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(DateTime.now().year + 2, 12, 12),
                initialDate: DateTime.now(),
                onDateSubmitted: (date) {

                },
              ),
             /* InputText(descriptionCtlr,
                  AppLocalizations.of(context)!.description,
                  mandatory: true),
              InputText(
                  locationCtlr, AppLocalizations.of(context)!.location,
                  mandatory: true),
              InputText(recurringCtlr,
                  AppLocalizations.of(context)!.recurring),*/
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: saveDates,
          child: const Icon(Icons.save),
        ),
        bottomNavigationBar: const BottomNavBar());
  }

  Future saveDates() async {
    /*EventsController eventsRepo = Get.find();
    
    eventId.insertTime =
        isNew ? DateTime.now() : eventId.insertTime;
    eventId.insertUser = isNew ? 'Andrea' : eventId.insertUser;
    eventId.updateTime = DateTime.now();
    eventId.updateUser = 'Andrea';

    if (isNew) {
      await eventsRepo.addEvent(eventId);
    } else {
      await eventsRepo.updateEvent(eventId);
    }

    await eventsRepo.getEventById(eventsRepo.eventId.value);

    Get.toNamed(NavigationConstants.EVENT_PAGE,
        arguments: {'event': eventsRepo.events[0]});*/
  }
}
