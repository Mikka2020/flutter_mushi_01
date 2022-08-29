import 'dart:io';

import 'package:flutter/material.dart';

import './models/insect.dart';

class InsectDetail extends StatelessWidget {
  const InsectDetail(
      {Key? key, required this.insect, required this.regInsectFilePath})
      : super(key: key);
  final Insect insect;
  final String regInsectFilePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe3fcff),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
              title: const Text(
                '虫のじょうほう',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: 280,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        color: Colors.limeAccent.withOpacity(.2),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Hero(
                      tag: insect.id,
                      child: Image(
                        image: FileImage(File(regInsectFilePath)),
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      insect.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 280,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 4.0, color: const Color(0xffb4b4b4)),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 15, right: 20, left: 20),
                          child: Text(
                            insect.description,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const Spacer(),
          ],
        ),
      ),
    );
  }
}
