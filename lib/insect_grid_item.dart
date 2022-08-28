import 'dart:io';

import 'package:flutter/material.dart';

import './insect_detail.dart';
import './models/insect.dart';

class InsectGridItem extends StatelessWidget {
  const InsectGridItem(
      {Key? key, required this.insect, required this.regInsectFilePath})
      : super(key: key);
  final Insect? insect;
  final String regInsectFilePath;

  @override
  Widget build(BuildContext context) {
    if (insect != null) {
      return Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  color: Colors.limeAccent.withOpacity(.2),
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => InsectDetail(
                          insect: insect!,
                          regInsectFilePath: regInsectFilePath),
                    ),
                  ),
                },
                child: SizedBox(
                  height: 90,
                  width: 90,
                  // 画像を表示する
                  child: Image(
                    image: FileImage(File(regInsectFilePath)),
                    height: 90,
                    width: 90,
                  ),
                ),
              ),
            ],
          ),
          Text(
            insect!.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
      return const SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
