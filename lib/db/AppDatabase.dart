import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../model/Person.dart';

class AppDatabase {
  static final AppDatabase appDatabase = AppDatabase._internal();

  AppDatabase._internal();

  Database _database;

  static AppDatabase get() {
    return appDatabase;
  }

  bool didInit = false;

  Future<Database> _getDb() async {
    if (!didInit) await _init();
    return _database;
  }

  Future _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "User_db.db");
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await _createUserTable(db);
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {});
    didInit = true;
  }

  Future _createUserTable(Database db) {
    return db.transaction((Transaction tnx) async {
      tnx.execute("CREATE TABLE ${Person.table_name} ("
          "${Person.column_id} INTEGER PRIMARY KEY AUTOINCREMENT,"
          "${Person.table_name} TEXT,"
          "${Person.column_addr} TEXT,"
          "${Person.column_age} INTEGER);");
    });
  }
}
