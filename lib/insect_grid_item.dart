import 'package:flutter/material.dart';

class InsectGridItem extends StatelessWidget {
  const InsectGridItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage('assets/no_image.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const Text('オオゴマダラ'),
      ],
    );
  }
}
