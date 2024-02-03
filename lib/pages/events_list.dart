import 'package:flutter/material.dart';
import 'package:follow_me/controllers/scroll_position_controller.dart';
import 'package:follow_me/controllers/events_controller.dart';
import 'package:follow_me/models/event.dart';
import 'package:get/get.dart';
import '../components/bottomnavbar.dart';
import '../components/fm_appbar.dart';
import '../components/fm_tile.dart';
import '../constants/navigation_constants.dart';

class EventsList extends StatefulWidget {
  final String category;
  const EventsList(this.category, {super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {

  final ScrollController _scrollController = ScrollController();
  final ScrollPositionController _scrollPositionController = Get.find();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_saveScrollPosition);
    // Jump to saved position on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollPositionController.getScrollPosition(widget.category));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EventsController eventsRepo = Get.find();
    eventsRepo.searchEvents(widget.category);

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
                      controller: _scrollController,
                      itemCount: eventsRepo.events.length,
                      itemBuilder: (context, index) {
                        return FmTile(eventsRepo.events[index]);
                      }),
                ),
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
            bottomNavigationBar: const BottomNavBar()
        )
    );
  }

  void _saveScrollPosition() {
    _scrollPositionController.saveScrollPosition(_scrollController.offset, widget.category);
  }
}
