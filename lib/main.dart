import 'package:flutter/material.dart';

import './home.dart';
import './map.dart';
import './mushi_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mushi Collection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const TopPage(title: 'むしこれ'),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentBtmNav = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          children: const [Home(), MushiList(), Map()],
          index: currentBtmNav,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(
            () => currentBtmNav = index,
          ),
        },
        currentIndex: currentBtmNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'さつえい',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'マップ',
          ),
        ],
      ),
    );
  }
}
