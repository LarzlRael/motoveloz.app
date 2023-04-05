import 'dart:io';

import 'package:WaraShops/data/constants.dart';
import 'package:WaraShops/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initD();
    return _database!;
  }

  initD() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = Path.join(documentsDirectory.path, databaseName);

    return await openDatabase(path,
        version: 1,
        onOpen: (db) => {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE $tableHistory('
              ' id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
              ' storeName Text,'
              ' storeUrl Text, '
              ' storeImageUrl Text'
              ');');
        });
  }

  /* hm history model */
  saveRaw(HistoryModel hm) async {
    final db = await database;

    final res = db.rawInsert(
        'INSERT INTO $tableHistory(storeName,storeUrl,storeImageUrl) VALUES ("${hm.storeName}","${hm.storeUrl}","${hm.storeImageUrl}")');
    return res;
  }

// Select - get info
  Future<HistoryModel?> getHistoryById(int id) async {
    final db = await database;
    final res = await db.query(tableHistory, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? HistoryModel.fromJson(res.first) : null;
  }

  Future<List<HistoryModel>> getAllHistory() async {
    final db = await database;
    final res = await db.query(tableHistory);

    List<HistoryModel> list =
        res.isNotEmpty ? res.map((c) => HistoryModel.fromJson(c)).toList() : [];
    return list;
  }

  Future<List<HistoryModel>> getHistoryByCondition(String condition) async {
    final db = await database;
    final res = await db
        .rawQuery("SELECT * FROM $tableHistory ORDER BY id ASC LIMIT 15");

    List<HistoryModel> list =
        res.isNotEmpty ? res.map((c) => HistoryModel.fromJson(c)).toList() : [];
    return list;
  }

  /* Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  } */

  Future<int> deleteHistoryById(int id) async {
    final db = await database;
    final res =
        await db.delete('$tableHistory', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM $HistoryModel');
    return res;
  }
}
