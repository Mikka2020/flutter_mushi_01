import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class FlutterOverboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('FlutterOverboardPage'),
      // ),
      body: Container(
        color: const Color(0xFFf1fff0),
        padding: const EdgeInsets.only(bottom: 80, top: 80),
        child: OverBoard(
          pages: pages,
          showBullets: true,
          nextText: "次へ",
          skipText: "スキップ",
          finishText: "遊んでみる",
          skipCallback: () {
            // when user select SKIP
            Navigator.pop(context);
          },
          finishCallback: () {
            // when user select NEXT
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  final pages = [
    PageModel(
        color: const Color(0xFF95cedd),
        imageAssetPath: 'assets/0.png',
        title: '[アプリ名]',
        body: 'このアプリは虫を撮影して学べる虫図鑑アプリです！',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF95cedd),
        imageAssetPath: 'assets/0.png',
        title: '虫のさつえい',
        body: 'まず下のカメラマークから虫を撮影してみよう！',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF95cedd),
        imageAssetPath: 'assets/0.png',
        title: '虫のはんべつ',
        body: '撮影したら[ずかんに記録]ボタンを押してずかんにとうろくしよう！',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF95cedd),
        imageAssetPath: 'assets/0.png',
        title: 'いろんな虫ずかん',
        body: 'ずかんでは撮影した虫についてのいろいろな事が知れるよ！',
        doAnimateImage: true),
    PageModel.withChild(
        child: const Padding(
            padding: EdgeInsets.only(bottom: 25.0, right: 25.0, left: 25.0),
            child: Text(
              "さあ、いろいろな虫を集めてみましょう！",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            )),
        color: const Color(0xFF5886d6),
        doAnimateChild: true)
  ];
}
