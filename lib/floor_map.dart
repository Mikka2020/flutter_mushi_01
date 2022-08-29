import 'package:flutter/material.dart';

class FloorMap extends StatelessWidget {
  const FloorMap({Key? key}) : super(key: key);
  static String btmNavId = "floor_map";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: InteractiveViewer(
                minScale: 0.1,
                maxScale: 5,
                child: const Image(
                  image: AssetImage('assets/img/floor_map.jpeg'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 36.0, top: 8.0),
              child: Text(
                "※画像の拡大縮小ができます",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
