import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/constants/navigation_constants.dart';
import 'package:follow_me/controllers/bottombar_controller.dart';
import 'package:get/get.dart';
import 'app_routes/app_routes.dart';
import 'firebase_options.dart';
import 'global_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //todo servono qui i bindings? come usarli al meglio?
  GlobalBindings().dependencies();
  runApp(const FollowMeApp());
}

class FollowMeApp extends StatelessWidget {
  const FollowMeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Follow Me',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationConstants.HOME_PAGE,
      getPages: AppRoutes.pages,
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.grey,
        fontFamily: 'Roboto',
      ),
      home: const FollowMeHomePage(),
    );
  }
}

class FollowMeHomePage extends StatelessWidget {
  const FollowMeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBarCtrl = Get.put(BottomBarController(), permanent: false);

    return Scaffold(
        body: Obx(() => Center(
          child: bottomBarCtrl.getScreen(),
        )),
        bottomNavigationBar: Obx(() =>
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
        )
    );
  }
}
