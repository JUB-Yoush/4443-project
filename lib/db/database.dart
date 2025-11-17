import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'models.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._internal();

  static Database? _database;

  AppDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/notes.db';
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
             CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT),
      ''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;
    final id = await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return user;
  }
}
