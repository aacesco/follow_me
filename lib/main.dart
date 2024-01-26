import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:follow_me/pages/spiritual_events_list.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Follow Me',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: 'spiritual_events',
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

class FollowMeHomePage extends StatefulWidget {
  const FollowMeHomePage({super.key});

  @override
  State<FollowMeHomePage> createState() => _FollowMeHomePageState();
}

class _FollowMeHomePageState extends State<FollowMeHomePage> with SingleTickerProviderStateMixin {

  int _currentIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    SpiritualEventsList(),
    const Text(
      'Index 1: Cultura',
      style: optionStyle,
    ),
    const Text(
      'Index 2: Svago',
      style: optionStyle,
    ),
    const Text(
      'Index 3: Promotori',
      style: optionStyle,
    ),
    const Text(
      'Index 4: Info',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
