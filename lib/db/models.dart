import 'package:flutter/material.dart';
import 'package:final_project_4443/db/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ActiveGoal {
  final int id;
  final String title;
  final IconData icon_id;
  final int goalAmount;
  final int currentAmount;
  final DateTime endDate;

  ActiveGoal(
    this.id,
    this.title,
    this.icon_id,
    this.goalAmount,
    this.currentAmount,
    this.endDate,
  );
}

class User {
  final int id;
  final String fname;
  final String lname;
  final String username;
  final String password;

  User(this.id, this.username, this.password, this.fname, this.lname);

  static String getSchema() {
    return "id INTEGER PRIMARY KEY, username TEXT, password TEXT fname TEXT, lname TEXT";
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'fname': fname,
      'lname': lname,
    };
  }

  static Future<void> insertUser(User user) async {
    final db = await AppDatabase.getDB();
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
