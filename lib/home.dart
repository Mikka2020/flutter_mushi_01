import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static String btmNavId = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 100,
            color: Colors.amber,
            child: const Text("見つけた数"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => {},
                child: const Text("あそびかた"),
              ),
              ElevatedButton(
                onPressed: () => {},
                child: const Text("（仮）"),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => {},
            child: const Text("ずかんを見る"),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
