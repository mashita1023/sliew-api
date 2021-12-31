import 'dart:async' show Future;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class Service {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
        return Response.ok('Get request');
    });

    router.mount('/api/', Api().router);

    return router;
  }
}

class Api {
  Future<Response> _messages(Request request) async {
    return Response.ok('[]');
  }

  Router get router {
    final router = Router();
    router.get('/messages', _messages);

    return router;
  }
}
