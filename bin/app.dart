import '../internal/di/di.dart';
import '../internal/external/mysql/mysql.dart';

void main() async {
  final server = initializeServer();
  final mysql = Mysql();
  var test = mysql.start();
  print(test);
  
//  await server.run();

//  print(server.server.runtimeType);
}

