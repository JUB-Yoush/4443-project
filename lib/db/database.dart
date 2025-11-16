import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

// class AppDatabase {
//   static final AppDatabase instance = AppDatabase._init();

//   static Database? _database;
// }
class AppDatabase {
  static Future<Database> getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), "app.db"),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)",
        );
      },
    );
  }
}
