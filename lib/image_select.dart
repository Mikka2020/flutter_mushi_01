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
      backgroundColor: const Color(0xffF9FFD5),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Container(
              alignment: const Alignment(0.0, 0.0),
              height: 200,
              width: 400,
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(width: 4, color: Colors.grey)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.file(
                  File(image.path),
                  fit: BoxFit.fill,
                  width: 420,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () {
                  upload(image.path);
                },
                child: Container(
                  child: const Center(
                    child: Text(
                      'ずかんに記録',
                      style: TextStyle(
                        fontFamily: 'Tsukushi A Round Gothic',
                        fontSize: 15,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ),
                  height: 50,
                  width: 140,
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
      ),
    );
  }
}
