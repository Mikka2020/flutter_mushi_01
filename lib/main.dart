import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './home.dart';
import './image_select.dart';
import './map.dart';

void main() {
  runApp(const MyApp());
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
      home: const TopPage(),
    );
  }
}

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);
  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int currentBtmNav = 0;
  // カメラ機能の処理
  File? image;
  late var decodeResult;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        debugPrint("setデバッグ：" + image.toString());
      }
    });
    if (image != null) {
      debugPrint("pushデバッグ: " + image.toString());
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => ImageSelect(image: image!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          children: const [
            Home(),
            Map(),
          ],
          index: currentBtmNav,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.add_a_photo),
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
            icon: Icon(Icons.settings),
            label: 'マップ',
          ),
        ],
      ),
    );
  }
}
