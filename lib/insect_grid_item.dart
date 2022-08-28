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
          InkWell(
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InsectDetail(
                      insect: insect!, regInsectFilePath: regInsectFilePath),
                ),
              ),
            },
            child: SizedBox(
              height: 100,
              width: 100,
              // 画像を表示する
              child: Image(
                image: FileImage(File(regInsectFilePath)),
                height: 100,
                width: 100,
              ),
            ),
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
