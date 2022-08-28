import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../config/db.dart';
import '../models/registered_insect.dart';

class RegisteredInsectsDb {
  static Future<Database> openDb() async {
    return await openDatabase(
        join(await getDatabasesPath(), registeredFileName),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE $registeredTableName (id INTEGER PRIMARY KEY, filePath Text)',
      );
    }, version: 1);
  }

  static Future<void> create(RegisteredInsect regIns) async {
    final Database db = await openDb();
    await db.insert(
      registeredTableName,
      regIns.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<RegisteredInsect>> read() async {
    final Database db = await openDb();
    final List<Map<String, dynamic>> maps = await db.query(registeredTableName);
    return List.generate(maps.length, (i) {
      return RegisteredInsect(
        insectId: maps[i]['id'],
        filePath: maps[i]['filePath'],
      );
    });
  }
}
