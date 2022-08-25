import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './floor_map.dart';
import './home.dart';
import './image_select.dart';

class IndexedStackBar extends StatefulWidget {
  const IndexedStackBar({Key? key}) : super(key: key);
  static String btmNavId = 'indexed_stack_bar';

  @override
  _IndexedStackBarState createState() => _IndexedStackBarState();
}

class _IndexedStackBarState extends State<IndexedStackBar> {
  int _selectedIndex = 0;
  // カメラ機能の処理
  File? image;
  late var decodeResult;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
      body: IndexedStack(
        index: _selectedIndex,
        children: const <Widget>[
          Home(),
          FloorMap(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.add_a_photo),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'フロアマップ',
          ),
        ],
      ),
    );
  }
}
