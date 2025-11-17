import 'package:flutter/material.dart';
import 'package:final_project_4443/db/database.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ActiveGoal {
  final int? id;
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
  static String table = "users";

  final int? id;
  final String fname;
  final String lname;
  final String username;
  final String password;

  User(this.id, this.fname, this.lname, this.username, this.password);

  static String getSchema() {
    return "_id INTEGER PRIMARY KEY, username TEXT, password TEXT, fname TEXT, lname TEXT";
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'lname': lname,
      'fname': fname,
    };
  }

  User copy({
    int? id,
    String? fname,
    String? lname,
    String? username,
    String? password,
  }) => User(
    id,
    fname ?? this.fname,
    lname ?? this.lname,
    username ?? this.username,
    password ?? this.password,
  );
}
