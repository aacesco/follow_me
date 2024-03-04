import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../components/bottomnavbar.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../components/dates/input_date_time_field.dart';
import '../controllers/dates_controller.dart';

class DatesManager extends StatelessWidget {
  final String eventId;

  DatesManager(this.eventId, {super.key});

  //final InputDatePickerFormField start
  final TextEditingController telegramCtlr = TextEditingController();
  final TextEditingController tagsCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DatesController datesController = Get.find();

    if (eventId.isBlank ?? true) {
      datesController.defaultStart();
      // telegramCtlr.text = eventId.telegram ?? AppConstants.EMPTY;
      //websiteCtlr.text = eventId.website ?? AppConstants.EMPTY;
    }

    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.datesManager)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: datesController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InputDateTimeField(AppLocalizations.of(context)!.start),
                    const SizedBox(height: 24),
                    InputDateTimeField(AppLocalizations.of(context)!.end),
                  ],
                ),
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

class IosStylePickers extends StatefulWidget {
  const IosStylePickers({super.key});

  @override
  _IosStylePickersState createState() => _IosStylePickersState();
}

class _IosStylePickersState extends State<IosStylePickers> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  DateTime? value;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('iOS style pickers (${format.pattern})'),
      DateTimeField(
        initialValue: value,
        format: format,
        onShowPicker: (context, currentValue) async {
          await showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return BottomSheet(
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: CupertinoDatePicker(
                          onDateTimeChanged: (DateTime date) {
                            value = date;
                          },
                        ),
                      ),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Ok')),
                    ],
                  ),
                  onClosing: () {},
                );
              });
          setState(() {});
          return value;
        },
      ),
    ]);
  }
}
