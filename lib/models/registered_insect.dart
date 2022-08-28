import 'package:flutter/material.dart';

import "./../db/registered_insect_db.dart";

class RegisteredInsectsNotifier extends ChangeNotifier {
  final List<RegisteredInsect> _regInses = [];

  RegisteredInsectsNotifier() {
    syncDb();
  }

  void syncDb() async {
    RegisteredInsectsDb.read().then(
      (val) => _regInses
        ..clear()
        ..addAll(val),
    );
    notifyListeners();
  }

  List<RegisteredInsect> get regInses => _regInses;

  void add(RegisteredInsect regIns) async {
    await RegisteredInsectsDb.create(regIns);
    syncDb();
  }
}

class RegisteredInsect {
  final int insectId;

  RegisteredInsect({
    required this.insectId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': insectId,
    };
  }
}
