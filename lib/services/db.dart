import 'dart:async';
import 'package:productify/models/model.dart';
import 'package:productify/models/task.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {

  static Database _db;
  static int get _version => 1;
  static List<Model> models = [Task()];

  static Future<void> init() async {

      if (_db != null) { return; }

      try {
          String _path = await getDatabasesPath() + 'database';
          _db = await openDatabase(_path, version: _version, onCreate: onCreate);
          print(_db);
      }
      catch(ex) { 
          print(ex);
      }
  }

  static void onCreate(Database db, int version) async {
    for(Model model in models) {
      await db.execute(model.getTableExecuteQuery());
    }
  }

  static Future<List<Map<String, dynamic>>> select(String table) async => _db.query(table);

  static Future<int> insert(String table, Model model) async =>
    await _db.insert(table, model.toMap());
  
  static Future<int> update(String table, Model model) async =>
    await _db.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
    await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);

  static Future<void> execute(String query) async =>
     await _db.execute(query);

  static Future<List<Map<String, dynamic>>> getTables() async =>
    await _db.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
}