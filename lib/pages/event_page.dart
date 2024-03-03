import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/constants/navigation_constants.dart';
import 'package:get/get.dart';
import '../app_routes/app_routes.dart';
import '../components/bottomnavbar.dart';
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
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.details),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.toNamed(AppRoutes.getRouteName(event));
              }),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoverImage(event.image),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 12),
                            child: Text(event.title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    height: 1.3,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold))),
                        Paragraph(AppLocalizations.of(context)!.description,
                            event.description),
                        Paragraph(AppLocalizations.of(context)!.location,
                            event.location,
                            icon: const Icon(Icons.pin_drop_outlined)),
                        Paragraph(
                          AppLocalizations.of(context)!.category,
                          event.category,
                          requiresLocalisation: true,
                        ),
                        Paragraph(AppLocalizations.of(context)!.notes,
                            event.notes ?? AppConstants.EMPTY),
                        Paragraph(AppLocalizations.of(context)!.audience,
                            event.audience ?? AppConstants.EMPTY),
                        Paragraph(
                          AppLocalizations.of(context)!.type,
                          event.type ?? AppConstants.EMPTY,
                          requiresLocalisation: true,
                        ),
                        Paragraph(AppLocalizations.of(context)!.contacts,
                            event.contacts ?? AppConstants.EMPTY),
                        Paragraph(AppLocalizations.of(context)!.promoter,
                            event.promoter ?? AppConstants.EMPTY),
                        Paragraph(AppLocalizations.of(context)!.guide,
                            event.guide ?? AppConstants.EMPTY),
                        Paragraph(AppLocalizations.of(context)!.website,
                            event.website ?? AppConstants.EMPTY),
                        Paragraph(AppLocalizations.of(context)!.whatsapp,
                            event.whatsapp ?? AppConstants.EMPTY),
                        Paragraph(AppLocalizations.of(context)!.telegram,
                            event.telegram ?? AppConstants.EMPTY),
                        Paragraph(AppLocalizations.of(context)!.likes,
                            event.likes.toString()),
                        Paragraph(AppLocalizations.of(context)!.tags,
                            event.tags?.join(',') ?? AppConstants.EMPTY),
                        Paragraph(
                            AppLocalizations.of(context)!.favorite,
                            event.favorite?.contains(event.id).toString() ??
                                AppConstants.EMPTY),
                        Paragraph(AppLocalizations.of(context)!.attachments,
                            event.attachments ?? AppConstants.EMPTY),
                        Paragraph(AppLocalizations.of(context)!.recurring,
                            event.recurring?.toString() ?? AppConstants.EMPTY),

                        //admin fields only
                        //todo aggiungere controllo su admin
                        Paragraph(AppLocalizations.of(context)!.latitude,
                            event.latitude.toString()),
                        Paragraph(AppLocalizations.of(context)!.longitude,
                            event.longitude.toString()),
                        Paragraph(AppLocalizations.of(context)!.insertTime,
                            event.insertTime.toString()),
                        Paragraph(AppLocalizations.of(context)!.insertUser,
                            event.insertUser),
                        Paragraph(AppLocalizations.of(context)!.updateTime,
                            event.updateTime.toString()),
                        Paragraph(AppLocalizations.of(context)!.updateUser,
                            event.updateUser),
                      ]))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: editEvent,
          child: const Icon(Icons.edit),
        ),
        bottomNavigationBar: const BottomNavBar());
  }

  Future editEvent() async {
    Get.toNamed(NavigationConstants.EDIT_EVENT_PAGE,
        arguments: {'event': event, 'isNew': false});
  }
}
