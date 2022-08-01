import 'dart:io';

import 'package:flutter/material.dart';

class ImageSelect extends StatelessWidget {
  const ImageSelect({Key? key, required this.image}) : super(key: key);
  final File image;

  void printImagePath(selectImage) {
    debugPrint("print関数デバッグ!: " + selectImage.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              width: 360,
              height: 400,
              child: ColoredBox(
                color: Colors.blue.shade200,
                child: Image.file(File(image.path)),
              ),
            ),
            ElevatedButton(
              onPressed: () => printImagePath(image),
              child: const Text("ずかんに記録"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
