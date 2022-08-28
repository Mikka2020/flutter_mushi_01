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
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(height: 32),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: 280,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        color: Colors.white.withOpacity(.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Image(
                      image: FileImage(File(regInsectFilePath)),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  insect.name,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
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
