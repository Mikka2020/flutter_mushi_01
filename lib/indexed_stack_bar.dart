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

  Future openModal() async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 180,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    height: 5,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
                ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('カメラでさつえい'),
                    onTap: () async {
                      getImage(true);
                    }),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('アルバムからえらぶ'),
                  onTap: () async {
                    getImage(false);
                  },
                ),
              ],
            ),
          );
        });
  }

  Future getImage(bool camera) async {
    XFile? pickedFile;
    camera == true
        ? pickedFile = await picker.pickImage(source: ImageSource.camera)
        : pickedFile = await picker.pickImage(source: ImageSource.gallery);

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
        backgroundColor: Colors.lightGreen.shade400,
        elevation: 0.0,
        onPressed: openModal,
        child: const Icon(Icons.add_a_photo),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightBlue,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'フロアマップ',
          ),
        ],
      ),
    );
  }
}
