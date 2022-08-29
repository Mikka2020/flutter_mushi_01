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
        backgroundColor: const Color(0xFFe3fcff),
        body: Container(
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  title: const Text(
                    '虫ずかん',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Consumer<InsectsNotifier>(
                    builder: (context, insects, child) {
                      if (itemCount(regInsects.regInsects) == 0) {
                        return Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(45),
                                child: Image.asset('assets/img/ss1.png'),
                              ),
                              const Text(
                                "まずはむしを撮影してみよう！",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
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
