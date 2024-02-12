import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/pages/spiritual_list.dart';
import 'package:get/get.dart';
import 'app_routes/app_routes.dart';
import 'firebase_options.dart';
import 'global_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GlobalBindings().dependencies();
  runApp(const FollowMeApp());
}

class FollowMeApp extends StatelessWidget {
  const FollowMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Follow Me',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.grey,
        fontFamily: 'Roboto',
      ),
      home: const SpiritualList(),
    );
  }
}