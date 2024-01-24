import 'package:flutter/material.dart';
import 'package:follow_me/data/events_controller.dart';
import 'package:follow_me/models/event.dart';
import 'package:get/get.dart';
import '../components/fm_appbar.dart';
import '../components/fm_tile.dart';

class SpiritualEventsList extends StatelessWidget {
  const SpiritualEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    final eventsRepo = Get.put(EventsController());
    eventsRepo.GetEvents();
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
              Obx(
                    () => ListView.builder(
                    itemCount: eventsRepo.events.length,
                    itemBuilder: (context, index) {
                      Event currentEvent = eventsRepo.events[index];
                      return FmTile( event: currentEvent,);
                    }),
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