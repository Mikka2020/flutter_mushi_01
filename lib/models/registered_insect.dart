import 'package:flutter/material.dart';

import "./../db/registered_insect_db.dart";

class RegisteredInsectsNotifier extends ChangeNotifier {
  final List<RegisteredInsect> _regInsects = [];

  RegisteredInsectsNotifier() {
    syncDb();
  }

  void syncDb() async {
    RegisteredInsectsDb.read().then(
      (val) => _regInsects
        ..clear()
        ..addAll(val),
    );
    notifyListeners();
  }

  List<RegisteredInsect> get regInsects => _regInsects;

  void add(RegisteredInsect regIns) async {
    await RegisteredInsectsDb.create(regIns);
    syncDb();
  }
}

class RegisteredInsect {
  final int insectId;
  final String filePath;

  RegisteredInsect({
    required this.insectId,
    required this.filePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': insectId,
      'filePath': filePath,
    };
  }
}
