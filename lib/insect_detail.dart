import 'package:flutter/material.dart';

class InsectDetail extends StatelessWidget {
  const InsectDetail({Key? key}) : super(key: key);
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
                  const SizedBox(
                    child: Image(
                      image: AssetImage("assets/no_image.png"),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Text(
                  "オオゴマダラ",
                  style: TextStyle(
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
