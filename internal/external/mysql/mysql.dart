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

  Future<User> select() async{
    var result = await this.conn.query('SELECT * FROM users');
    print(result);
    User user = User(1, "taro hanako");
    return user;
  }
}
