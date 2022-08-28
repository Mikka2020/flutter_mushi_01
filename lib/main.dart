import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import './floor_map.dart';
import './home.dart';
import './indexed_stack_bar.dart';
import 'models/insect.dart';
import 'models/registered_insect.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final insectsNotifier = InsectsNotifier();
  final registeredInsectsNotifier = RegisteredInsectsNotifier();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<InsectsNotifier>(
        create: (context) => insectsNotifier,
      ),
      ChangeNotifierProvider<RegisteredInsectsNotifier>(
        create: (context) => registeredInsectsNotifier,
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: IndexedStackBar.btmNavId,
        routes: {
          Home.btmNavId: (context) => const Home(),
          FloorMap.btmNavId: (context) => const FloorMap(),
          IndexedStackBar.btmNavId: (context) => const IndexedStackBar(),
        });
  }
}
