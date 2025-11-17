import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'models.dart';

class AppDB {
  static final AppDB instance = AppDB._init();
  AppDB._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("app.db");

    await _database!.execute('''
        DROP TABLE users
    ''');

    await _database!.execute('''
  CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, fname TEXT, lname TEXT, password TEXT)
  ''');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
        DROP TABLE users
    ''');
    await db.execute('''
  CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, fname TEXT, lname TEXT, password TEXT)
''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;
    final id = await db.insert("users", user.toMap());

    return user.copy(id: id);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
