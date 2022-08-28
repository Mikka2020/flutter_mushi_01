import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import './config/uri.dart';
import 'indexed_stack_bar.dart';
import 'models/registered_insect.dart';

class ImageSelect extends StatefulWidget {
  const ImageSelect({Key? key, required this.image}) : super(key: key);
  final File image;

  @override
  State<ImageSelect> createState() => _ImageSelectState(image: image);
}

class _ImageSelectState extends State<ImageSelect> {
  _ImageSelectState({required this.image});
  var image;
  var decodeResult;
  var decodeInsectResult;

  void printImagePath(selectImage) {
    debugPrint("print関数デバッグ!: " + selectImage.toString());
  }

  // 全画面プログレスダイアログを表示する関数
  void showProgressDialog(context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration.zero,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Material(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text('はんべつ中...',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }

  //画像判別APIアップロード
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

      decodeResult = json.decode(responseString);
      print(decodeResult);

      //昆虫情報取得
      Uri uri = Uri.parse(insectEndpoint + '/' + decodeResult[0]['index']);
      var insectResponse = await http.get(uri);
      decodeInsectResult = json.decode(insectResponse.body);
      print(decodeInsectResult["results"]);
      // 遅延させて再読み込み
      Navigator.of(context, rootNavigator: true).pop();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisteredInsectsNotifier>(
      builder: (context, regInsects, child) => Scaffold(
        backgroundColor: const Color(0xffF9FFD5),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 80),
                child: decodeResult == null
                    ? const Text(
                        'はんべつ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        "この虫は..." +
                            decodeInsectResult["results"][0]["insect_name"] +
                            "!",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: decodeResult == null
                    ? const Text("この虫をはんべつしますか？")
                    : const Text("この虫をとうろくしますか？"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  alignment: const Alignment(0.0, 0.0),
                  height: 200,
                  width: 400,
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 30, right: 40, left: 40),
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
              ),
              decodeResult != null
                  ? Container(
                      height: 250,
                      width: 280,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 4.0, color: const Color(0xffb4b4b4)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                decodeInsectResult["results"][0]
                                        ["insect_moku"] +
                                    "目 " +
                                    decodeInsectResult["results"][0]
                                        ["insect_ka"] +
                                    "科 ",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 15, left: 15),
                              child: Text(decodeInsectResult["results"][0]
                                  ["insect_text"]),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: 5,
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: decodeResult == null
                    ? InkWell(
                        onTap: () async {
                          showProgressDialog(context);
                          await Future<dynamic>.delayed(Duration(seconds: 2));
                          upload(image.path);
                        },
                        child: Container(
                          child: const Center(
                            child: Text(
                              'はんべつする',
                              style: TextStyle(
                                fontFamily: 'Tsukushi A Round Gothic',
                                fontSize: 15,
                                color: Color(0xffffffff),
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
                            border: Border.all(
                                width: 4.0, color: const Color(0xffb4b4b4)),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          const snackBar = SnackBar(
                            content: Text('ずかんに登録しました！'),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          regInsects.add(
                            RegisteredInsect(
                                insectId: decodeInsectResult["results"][0]
                                    ["insect_id"]),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IndexedStackBar(),
                            ),
                          );
                          // TODO: 登録完了のリアクションが欲しい
                        },
                        child: Container(
                          child: const Center(
                            child: Text(
                              'とうろくする',
                              style: TextStyle(
                                fontFamily: 'Tsukushi A Round Gothic',
                                fontSize: 15,
                                color: Color(0xffffffff),
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
