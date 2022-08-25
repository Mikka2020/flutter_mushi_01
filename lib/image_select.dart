import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './config/uri.dart';

class ImageSelect extends StatelessWidget {
  const ImageSelect({Key? key, required this.image}) : super(key: key);
  final File image;

  void printImagePath(selectImage) {
    debugPrint("print関数デバッグ!: " + selectImage.toString());
  }

  Future upload(String filePath) async {
    // connect to localhost
    Uri uri = Uri.parse(endpoint);

    http.MultipartRequest request = http.MultipartRequest("POST", uri);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('file', filePath);

    request.files.add(multipartFile);

    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      // jsondecode

      final decodeResult = json.decode(responseString);
      print(decodeResult);
    }
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
              onPressed: () => upload(image.path),
              child: const Text("ずかんに記録"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
