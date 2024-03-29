import 'package:flutter/material.dart';
import 'package:follow_me/constants/app_constants.dart';
import 'package:follow_me/controllers/scroll_position_controller.dart';
import 'package:follow_me/controllers/events_controller.dart';
import 'package:follow_me/models/event.dart';
import 'package:get/get.dart';
import '../components/bottomnavbar.dart';
import '../components/fm_appbar.dart';
import '../components/event_tile.dart';
import '../components/temp_favorite.dart';
import '../constants/navigation_constants.dart';

class SpiritualList extends StatefulWidget {
  const SpiritualList({super.key});

  @override
  State<SpiritualList> createState() => _SpiritualListState();
}

class _SpiritualListState extends State<SpiritualList> {
  final ScrollController _scrollController = ScrollController();
  final ScrollPositionController _scrollPositionController = Get.find();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_saveScrollPosition);
    // Jump to saved position on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollPositionController
            .getScrollPosition(AppConstants.SPIRITUAL));
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
    eventsRepo.searchEvents(AppConstants.SPIRITUAL);

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
                        return EventTile(eventsRepo.events[index]);
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
        "_saveScrollPosition ${AppConstants.SPIRITUAL} offset ${_scrollController.offset}");
    _scrollPositionController.saveScrollPosition(
        _scrollController.offset, AppConstants.SPIRITUAL);
  }
}
