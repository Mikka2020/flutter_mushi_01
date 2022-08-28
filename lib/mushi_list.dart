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
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: itemCount(),
                  itemBuilder: (context, index) {
                    return const InsectGridItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
