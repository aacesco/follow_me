import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controllers/bottombar_controller.dart';

class BottomNavBar extends StatelessWidget {

  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    BottomBarController bottomBarCtrl = Get.find();

    return Obx(() =>
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0x43232122) ,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.route),
              label: AppLocalizations.of(context)!.spiritualEvents,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.theater_comedy),
              label: AppLocalizations.of(context)!.culturalEvents,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.hiking),
              label: AppLocalizations.of(context)!.leisureEvents,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.nature_people),
              label: AppLocalizations.of(context)!.promoters,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.info),
              label: AppLocalizations.of(context)!.info,
            )
          ],
          currentIndex: bottomBarCtrl.selectedIndex.value,
          onTap: bottomBarCtrl.changeTabIndex,
        ),
    );
  }
}