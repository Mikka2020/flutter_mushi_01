import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mushi_01/main.dart';
import 'package:flutter_mushi_01/mushi_list.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  // void  dispose() {
  //   <Home>.dispose();
  //   super.dispose();
  // }

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _showTutorial(context));
    return Scaffold(
      backgroundColor: const Color(0xffF9FFD5),
      body: Column(
        children: [
          const Spacer(),
          Container(
            child: const Center(
              child: Text(
                '見つけた数',
                style: TextStyle(
                  fontFamily: 'Tsukushi A Round Gothic',
                  fontSize: 15,
                  color: const Color(0x80bf7107),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ),
            height: 130,
            width: 230,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 4.0, color: const Color(0xffb4b4b4)),
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
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/img/smartphone.png'),
                                fit: BoxFit.fill,
                              ),
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
                      color: const Color(0x80bf7107),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: 4.0, color: const Color(0xffb4b4b4)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/img/web.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const Text(
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
                      color: const Color(0x80bf7107),
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
                  children: [
                    // Adobe XD layer: 'ずかんアイコン' (group)
                    SizedBox(
                      height: 55,
                      width: 70,
                      child: SvgPicture.string(
                        '<svg viewBox="0.0 0.0 63.9 47.5" ><path transform="translate(0.0, -6.14)" d="M 63.86546325683594 25.24668312072754 L 38.99964904785156 6.292964458465576 C 38.77262878417969 6.11982536315918 38.41699981689453 6.091587066640391 38.1479377746582 6.225743293762207 L 0 25.24668312072754 L 0 25.24668312072754 L 0 34.33452987670898 C 0 34.47192001342773 0.07159973680973053 34.60341262817383 0.198832705616951 34.70029830932617 L 24.86581420898438 53.50217437744141 C 25.09333801269531 53.67560195922852 25.4485912322998 53.70346069335938 25.71752548217773 53.56938934326172 L 63.55847930908203 34.70210266113281 C 63.75045013427734 34.60626220703125 63.865966796875 34.44358062744141 63.865966796875 34.26901626586914 L 63.865966796875 25.24658203125 L 63.86546325683594 25.24658203125 Z M 4.005842685699463 33.06998062133789 L 4.005842685699463 28.2996711730957 L 4.005842685699463 28.2996711730957 L 24.37035179138184 43.82246398925781 C 24.49745941162109 43.91935729980469 24.56918334960938 44.05084609985352 24.56918334960938 44.18832778930664 L 24.56918334960938 47.70920562744141 C 24.56918334960938 48.17042922973633 23.83834457397461 48.40109252929688 23.41049003601074 48.07497024536133 L 4.204551219940186 33.43574905395508 C 4.076818466186523 33.3388671875 4.005842685699463 33.20698928833008 4.005842685699463 33.06998062133789 Z M 25.90413475036621 44.45379638671875 C 25.90413475036621 44.27922439575195 26.02013969421387 44.11655044555664 26.21161460876465 44.02109146118164 L 58.80969619750977 27.76741790771484 C 59.2609977722168 27.54236602783203 59.86024475097656 27.78928565979004 59.86024475097656 28.20040702819824 L 59.86024475097656 32.61750411987305 C 59.86024475097656 32.79206466674805 59.74473571777344 32.95512771606445 59.55276489257812 33.05058670043945 L 26.95467948913574 49.30463409423828 C 26.50350189208984 49.52967834472656 25.90413475036621 49.28276062011719 25.90413475036621 48.87163925170898 L 25.90413475036621 44.45379638671875 Z M 46.66182708740234 26.61268424987793 L 40.87857818603516 29.49262619018555 C 40.49314117431641 29.68459510803223 39.98396301269531 29.6441822052002 39.65839004516602 29.39602279663086 L 27.39026641845703 20.04452705383301 C 26.95367813110352 19.71175003051758 27.02864646911621 19.1568717956543 27.54568862915039 18.89910888671875 L 33.31969451904297 16.02068901062012 C 33.70513534545898 15.82872581481934 34.21431732177734 15.86837291717529 34.54039001464844 16.11691093444824 L 46.81736373901367 25.46736145019531 C 47.25432586669922 25.80013847351074 47.17923355102539 26.35530471801758 46.66182708740234 26.61268424987793 Z" fill="#4b4b4b" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                    // Adobe XD layer: 'ずかんアイコン' (group)
                    const Center(
                      child: Text(
                        'ずかんを見る',
                        style: TextStyle(
                          fontFamily: 'Tsukushi A Round Gothic',
                          fontSize: 17,
                          color: const Color(0xffffffff),
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
                  color: const Color(0x80bf7107),
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(width: 4.0, color: const Color(0xffb4b4b4)),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
