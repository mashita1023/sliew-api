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

  Future<User> select(ctx, sql) async{
    var result = await this.conn.query(sql);
    var data = result.first;
    User user = User(data['id'], data['name']);
    return user;
  }
}
