import 'dart:async' show Future;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'router.dart';

class Server {

  var server;
  var service;

  Server(service) {
    this.service = service;
  }
  run() async{
    final handler = _handler();
    final server = await shelf_io.serve(handler, 'localhost', 8080);
    this.server = server;
    print('Server runnning on localhost:${server.port}');
  }

  _handler() {
    final pipeline = Pipeline().addMiddleware(logRequests()).addHandler(service.handler);

    return pipeline;
  }
}
