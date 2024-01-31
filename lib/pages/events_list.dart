import 'package:flutter/material.dart';
import 'package:follow_me/controllers/scroll_controller.dart';
import 'package:follow_me/data/events_controller.dart';
import 'package:follow_me/models/event.dart';
import 'package:get/get.dart';
import '../components/fm_appbar.dart';
import '../components/fm_tile.dart';
import '../constants/navigation_constants.dart';

class EventsList extends StatelessWidget {
  final String category;
  const EventsList(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    final eventsRepo = Get.put(EventsController());
    eventsRepo.searchEvents(category);

    final scroller = Get.put(ScrollingController());

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
              Scrollbar(
                  controller: scroller.scroller.value,
                  child:
                  Obx(
                        () => ListView.builder(
                        controller: scroller.scroller.value,
                        itemCount: eventsRepo.events.length,
                        itemBuilder: (context, index) {
                          return FmTile(eventsRepo.events[index]);
                        }),
                  )

              ),
              /*Obx(
                    () => ListView.builder(
                        controller: scroller.scroller,
                    itemCount: eventsRepo.events.length,
                    itemBuilder: (context, index) {
                      return FmTile(eventsRepo.events[index]);
                    }),
              ),*/
              ListView.builder(
                key: PageStorageKey<String>('pageOne'),
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      eventsRepo.getEventById('');
                      Get.toNamed(NavigationConstants.EDIT_EVENT_PAGE, id:1, arguments: {'event': eventsRepo.events[0], 'isNew': false});
                    },
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    title: Text('test $index'),
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Get.toNamed(NavigationConstants.EDIT_EVENT_PAGE, id:1, arguments: {'event': Event('', '', '', '', '',
                  '', DateTime.now(), '', DateTime.now()), 'isNew': true});
            },
            child: const Icon(Icons.add),
          ),
        )
    );
  }
}