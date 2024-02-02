import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/constants/navigation_constants.dart';
import 'package:get/get.dart';
import '../models/event.dart';
import '../pages/events_list.dart';


class FmAppBar extends StatefulWidget implements PreferredSizeWidget {
  const FmAppBar({Key? key}) : preferredSize = const Size.fromHeight(kToolbarHeight * 2);

  @override
  State<FmAppBar> createState() => _FmAppBarState();

  @override
  final Size preferredSize; // default is 56.0
}

class _FmAppBarState extends State<FmAppBar> {

  @override
  Widget build(BuildContext context) {

    return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){},
        ),
        title: Text(AppLocalizations.of(context)!.category),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_alt),
            onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){
              final parent = context.findAncestorWidgetOfExactType<EventsList>();

              Get.toNamed(NavigationConstants.EDIT_EVENT_PAGE, arguments: {'event': Event('', '', '', '', '',
                  '', DateTime.now(), '', DateTime.now()), 'isNew': true});
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){
              Get.toNamed(NavigationConstants.AUTH_GATE);
            },
          )
        ],
        scrolledUnderElevation: 4.0,
        shadowColor: Theme.of(context).shadowColor,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              text: AppLocalizations.of(context)!.all,
            ),
            Tab(
              text: AppLocalizations.of(context)!.favorite,
            ),
          ],
        )
    );
  }
}
