import 'package:flutter/material.dart';

import './insect_detail.dart';

class InsectGridItem extends StatelessWidget {
  const InsectGridItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const InsectDetail(),
              ),
            ),
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(.5),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/no_image.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        const Text('オオゴマダラ'),
      ],
    );
  }
}
