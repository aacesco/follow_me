import 'package:flutter/material.dart';
import 'package:follow_me/data/events_repo.dart';
import 'package:follow_me/models/event.dart';
import 'package:get/get.dart';
import '../components/fm_appbar.dart';
import '../components/fm_tile.dart';
import '../global_bindings.dart';


class SpiritualEventsList extends StatefulWidget {
  const SpiritualEventsList({super.key});

  @override
  State<SpiritualEventsList> createState() => _SpiritualEventsListState();
}

class _SpiritualEventsListState extends State<SpiritualEventsList> {

  @override
  void initState() {
    super.initState();
    GlobalBindings().dependencies();
    final eventsRepo = Get.put(EventsRepo());
    eventsRepo.GetSpiritualEvents();
  }

  @override
  Widget build(BuildContext context) {
    final eventsRepo = Get.put(EventsRepo());
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 2;

    return DefaultTabController(
        length: tabsCount,
        child: Scaffold(
          appBar: const FmAppBar( ),
          body: TabBarView(
            children: <Widget>[
              FutureBuilder(
                future: eventsRepo.GetSpiritualEvents(),
                builder: (context, snapshot) {
                  //TODO migliorare error handling
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData ) {
                      List<Event> events = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (_, index) {
                          Event currentEvent = events[index];
                          return FmTile( event: currentEvent,);
                        },
                      );
                    }
                  } else{
                    return const Text("No connection..");
                  }

                  return const Text("loading..");
                },
              ),
              ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    title: Text('test $index'),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Get.toNamed("/edit_event_page", arguments: {'event': Event('', '', '', '', '',
                  '', DateTime.now(), '', DateTime.now()), 'isNew': true});
            },
            child: const Icon(Icons.add),
          ),
        )
    );
  }

}
