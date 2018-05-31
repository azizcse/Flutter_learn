import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../model/Person.dart';
class AppDatabase{

  static final AppDatabase appDatabase = AppDatabase._internal();

  AppDatabase._internal();

  Database _database;

  static AppDatabase get(){
    return appDatabase;
  }
  bool didInit = false;
  Future<Database> _getDb()async{
    if(!didInit)await _init();
    return _database;
  }

  Future _init()async{

  }


  Future _createUserTable(Database db){
    return db.transaction((Transaction tnx)async {
      tnx.execute("CREATE TABLE ${Person.table_name} ("
      "${Person.column_id} INTEGER PRIMARY KEY AUTOINCREMENT,"
      "${Person.table_name} TEXT,"
      "${Person.column_addr} TEXT,"
      "${Person.column_age} INTEGER);");
    });
  }
}