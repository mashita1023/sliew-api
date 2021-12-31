import 'dart:async' show Future;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'router.dart';

class Server {
  void Run() async{
    final service = Service();
    final server = await shelf_io.serve(service.handler, 'localhost', 8080);
    print('Server runnning on localhost:${server.port}');
  }
}
