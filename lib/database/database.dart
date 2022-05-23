// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseConnection {
//
//   Future<Database> setDatabase() async{
//     var directory = await getApplicationDocumentsDirectory();
//     var path = join(directory.path,'user_data');
//     var database = await openDatabase(path,version: 1,onCreate: _onCreateDatabase);
//     return database;
//   }
//  Future<void> _onCreateDatabase (Database database, int version) async{
//     String bla = "CREATE TABLE sign(id INTEGER PRIMARY KEY,userName TEXT,fullName TEXT,email TEXT,password TEXT)";
//     await database.execute(bla);
//  }
// }

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection{
  Future<Database>setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_crud');
    var database =
    await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }
  Future<void>_createDatabase(Database database, int version) async {
    String sql=
        "CREATE TABLE users (id INTEGER PRIMARY KEY,userName TEXT,fullName Text,email TEXT,phoneNumber TEXT);";//understood
    await database.execute(sql);
  }
}