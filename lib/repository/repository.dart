

// import 'package:sqflite/sqflite.dart';
// import 'package:to_do_app_portfolio/database/database.dart';
//
// class Repository{
//   late DatabaseConnection _databaseConnection;
//
//   Repository (){
//     _databaseConnection = DatabaseConnection();
//   }
//
//   static Database? _database;
//
//   Future<Database?> get database async{
//     if (_database != null){
//       return _database;
//     }
//     else{
//       _database = await _databaseConnection.setDatabase();
//     }
//   }
//
//   insertData(table, data)async{
//
//     var connecting = await database;
//     return await connecting?.insert(table, data);
//   }
//   readData(table)async{// reading  data read all the whole table
//     var connecting = await database;
//     return await connecting?.query(table);
//   }
// }

import 'package:sqflite/sqflite.dart';

import '../database/database.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection= DatabaseConnection();
  }
  static Database? _database;
  Future<Database?>get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }
}