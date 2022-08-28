import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './insect_grid_item.dart';
import './models/insect.dart';
import './models/registered_insect.dart';

class MushiList extends StatelessWidget {
  const MushiList({Key? key}) : super(key: key);

  int itemCount(List<RegisteredInsect> regInsects) {
    return regInsects.length;
  }

  int itemId(List<RegisteredInsect> regInsects, int index) {
    return regInsects[index].insectId;
  }

  String itemPath(List<RegisteredInsect> regInsects, int index) {
    return regInsects[index].filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisteredInsectsNotifier>(
      builder: (context, regInsects, child) => Scaffold(
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
                  child: Consumer<InsectsNotifier>(
                    builder: (context, insects, child) {
                      if (itemCount(regInsects.regInsects) == 0) {
                        return const Text("no data");
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: itemCount(regInsects.regInsects),
                          itemBuilder: (context, index) {
                            return InsectGridItem(
                                insect: insects
                                    .byId(itemId(regInsects.regInsects, index)),
                                regInsectFilePath:
                                    itemPath(regInsects.regInsects, index));
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
