import 'package:mysql1/mysql1.dart';

class Mysql {
  start() async {
    var settings = new ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'mysql',
      password: 'pwd',
      db: 'precomm'
    );
    var conn = await MySqlConnection.connect(settings);
    var results = await conn.query('SELECT * FROM user');
    print(results);
    return results;
  }
}
