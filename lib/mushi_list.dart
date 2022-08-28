import 'package:flutter/material.dart';

import './insect_grid_item.dart';

class MushiList extends StatelessWidget {
  const MushiList({Key? key}) : super(key: key);

  int itemCount() {
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: itemCount(),
        itemBuilder: (context, index) {
          return const InsectGridItem();
        },
      ),
    );
  }
}
