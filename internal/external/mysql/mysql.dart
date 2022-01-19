import 'dart:async';
import 'package:mysql1/mysql1.dart';

import '../../entity/user.dart';
import '../../interface/repository/external/database.dart';

class Mysql implements Database{
  var conn;

  Mysql();

  Future<void> connect() async{
    var settings = new ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mysql',
      password: 'pwd',
      db: 'precomm'
    );
    this.conn = await MySqlConnection.connect(settings);
  }

  Future<List<Map<String, dynamic>>> get(ctx, sql) async {
    var results = await this.conn.query(sql);
    List resultsList = results.toList();
    List<Map<String, dynamic>> list = [];

    if (resultsList.length == 0) {
      throw Exception("Bad state: No element");
    }
    
    resultsList.forEach((result) {
        list.add(result.fields);
    });

    return list;
  }

  Future<Map<String, dynamic>> single(ctx, sql) async{
    var result = await this.conn.query(sql);
    var data = result.first.fields;
    return data;
  }

  Future<Map<String, dynamic>> insert(ctx, sql) async {
    var result = await conn.query(sql);
    var data = result.first.fields;
    return data;
  }

  Future<Map<String, dynamic>> update(ctx, sql, getSQL) async {
    await conn.query(sql);
    var result = await conn.query(getSQL);
    var data = result.first.fields;
    return data;
  }
}
