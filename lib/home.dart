import 'package:flutter/material.dart';
import 'package:flutter_mushi_01/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './flutter_overboard_page.dart';
import './main.dart';

void _showTutorial(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();

  if (pref.getBool('isAlreadyFirstLaunch') != true) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return FlutterOverboardPage();
        },
        fullscreenDialog: true,
      ),
    );
    pref.setBool('isAlreadyFirstLaunch', true);
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static String btmNavId = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _showTutorial(context));
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 100,
            color: Colors.amber,
            child: const Text("見つけた数"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final pref = await SharedPreferences.getInstance();
                  pref.setBool('isAlreadyFirstLaunch', false);
                  setState(() {});
                },
                child: const Text("あそびかた"),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: const Text("（仮）"),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text("ずかんを見る"),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
