import 'package:flutter/material.dart';

import '../api/insect_api.dart';

class InsectsNotifier extends ChangeNotifier {
  final Map<int, Insect?> _insectMap = {};

  Map<int, Insect?> get insects => _insectMap;

  void addInsect(Insect ins) {
    _insectMap[ins.id] = ins;
    notifyListeners();
  }

  void fetchIns(int id) async {
    _insectMap[id] = null;
    addInsect(await fetchInsect(id));
  }

  Insect? byId(int id) {
    if (!_insectMap.containsKey(id)) {
      fetchIns(id);
    }
    return _insectMap[id];
  }
}

class Insect {
  final int id;
  final String name;
  final String description;
  // final String imagePath;

  Insect({
    required this.id,
    required this.name,
    required this.description,
    // required this.imagePath,
  });

  factory Insect.fromJson(Map<String, dynamic> json) {
    return Insect(
        id: json['results'][0]['insect_id'],
        name: json['results'][0]['insect_name'],
        description: json['results'][0]['insect_text']);
    // imagePath: json['imagePath']);
  }
}
