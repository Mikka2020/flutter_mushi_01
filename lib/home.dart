import 'package:flutter/material.dart';
import 'package:flutter_mushi_01/models/insect.dart';
import 'package:flutter_mushi_01/mushi_list.dart';
import 'package:flutter_mushi_01/offcial_webpage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './flutter_overboard_page.dart';
import './main.dart';
import 'models/registered_insect.dart';

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
  // void  dispose() {
  //   <Home>.dispose();
  //   super.dispose();
  // }

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int itemCount(List<RegisteredInsect> regInsects) {
    return regInsects.length;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _showTutorial(context));
    return Consumer<RegisteredInsectsNotifier>(
      builder: (context, regInsects, child) => Scaffold(
        backgroundColor: const Color(0xffF9FFD5),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/background.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, bottom: 5.0, left: 50.0, right: 50.0),
                // ここを追加
                child: Image.asset('assets/img/logo.png'),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade600, width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "撮って楽しく学べる虫ずかん",
                  style: TextStyle(
                      fontSize: 15,
                      backgroundColor: Colors.white,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Spacer(),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'みつけた数',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xaabf7107),
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: false,
                      ),
                      Consumer<InsectsNotifier>(
                        builder: (context, insects, child) {
                          return Text(
                            itemCount(regInsects.regInsects).toString() +
                                '/87種類',
                            style: const TextStyle(
                              fontFamily: 'Tsukushi A Round Gothic',
                              fontSize: 28,
                              color: Color(0xddbf7907),
                              fontWeight: FontWeight.w800,
                            ),
                            softWrap: false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                height: 130,
                width: 230,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(width: 4.0, color: const Color(0xffb4b4b4)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        final pref = await SharedPreferences.getInstance();
                        pref.setBool('isAlreadyFirstLaunch', false);
                        setState(() {});
                      },
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Adobe XD layer: 'あそびかたアイコン' (shape)
                              Container(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.help_outline,
                                  color: Colors.lightGreenAccent,
                                  size: 40.0,
                                ),
                              ),
                              const Text(
                                'あそびかた',
                                style: TextStyle(
                                  fontFamily: 'Tsukushi A Round Gothic',
                                  fontSize: 15,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                ),
                                softWrap: false,
                              ),
                            ],
                          ),
                        ),
                        height: 90,
                        width: 140,
                        decoration: BoxDecoration(
                          color: const Color(0xddbf7107),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 4.0, color: const Color(0xffb4b4b4)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const OfficialWebpage()),
                        );
                      },
                      child: Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.screen_search_desktop_outlined,
                                  size: 40.0,
                                  color: Colors.lightGreenAccent,
                                ),
                              ),
                              Text(
                                '昆虫館のサイト',
                                style: TextStyle(
                                  fontFamily: 'Tsukushi A Round Gothic',
                                  fontSize: 15,
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                ),
                                softWrap: false,
                              ),
                            ],
                          ),
                        ),
                        height: 90,
                        width: 140,
                        decoration: BoxDecoration(
                          color: const Color(0xddbf7107),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              width: 4.0, color: const Color(0xffb4b4b4)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => const MushiList()),
                    );
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        // Adobe XD layer: 'ずかんアイコン' (group)
                        SizedBox(
                          height: 55,
                          width: 55,
                          child: Icon(
                            Icons.menu_book_outlined,
                            color: Colors.lightGreenAccent,
                            size: 55.0,
                          ),
                        ),
                        // Adobe XD layer: 'ずかんアイコン' (group)
                        Center(
                          child: Text(
                            'ずかんを見る',
                            style: TextStyle(
                              fontFamily: 'Tsukushi A Round Gothic',
                              fontSize: 17,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                    height: 120,
                    width: 180,
                    decoration: BoxDecoration(
                      color: const Color(0xddbf7107),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: 4.0, color: const Color(0xffb4b4b4)),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
