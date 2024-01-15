import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/cover_image.dart';
import '../constants/app_constants.dart';
import '../models/event.dart';
import 'edit_event_page.dart';

class EventPage extends StatefulWidget {
  final Event event;

  const EventPage(this.event, {super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  late CoverImage image;
  late Title title;
  late Text description;
  late Text location;
  late Text category;
  late Text notes;

  @override
  void initState() {
    image = CoverImage(event: widget.event);
    title = Title(color: Colors.black, child: Text(widget.event.title));
    description = Text(widget.event.description);
    location = Text(widget.event.location);
    notes =  Text(widget.event.notes ?? AppConstants.EMPTY);
    category = Text(widget.event.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.article)),
      floatingActionButton: FloatingActionButton(
        onPressed: editEvent,
        child: const Icon(Icons.edit),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image,
            title,
            Title(color: Colors.black, child: Text(AppLocalizations.of(context)!.description)),
            description,
            Title(color: Colors.black, child: Text(AppLocalizations.of(context)!.location)),
            location,
            Title(color: Colors.black, child: Text(AppLocalizations.of(context)!.category)),
            category,
            Title(color: Colors.black, child: Text(AppLocalizations.of(context)!.notes)),
            notes
          ],
        ),
      ),
    );
  }

  Future editEvent() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) =>  EditEventPage(widget.event, false)));
  }
}
