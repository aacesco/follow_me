import 'package:flutter/material.dart';
import 'package:follow_me/components/temp_favorite.dart';
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
  final ScrollPositionController _scrollPositionController =
      Get.put(ScrollPositionController());

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_saveScrollPosition);
    // Jump to saved position on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        // var pos = _scrollPositionController.getScrollPosition(widget.category);
        // print("jump " + widget.category + " " + pos.toString());
        _scrollController.jumpTo(
            _scrollPositionController.getScrollPosition(widget.category));
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

    const int tabsCount = 2;

    return DefaultTabController(
        length: tabsCount,
        child: Scaffold(
            appBar: const FmAppBar(),
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
                const TempFavorite(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.toNamed(NavigationConstants.EDIT_EVENT_PAGE, arguments: {
                  'event': Event('', '', '', '', '', '', DateTime.now(), '',
                      DateTime.now()),
                  'isNew': true
                });
              },
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: const BottomNavBar()));
  }

  void _saveScrollPosition() {
    print(
        "_saveScrollPosition ${widget.category} offset ${_scrollController.offset}");
    _scrollPositionController.saveScrollPosition(
        _scrollController.offset, widget.category);
  }
}
