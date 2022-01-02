import 'dart:async' show Future;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import '../../interface/controller/health_controller.dart';

class Service {
  var healthController;

  Service(healthController) {
    this.healthController = healthController;
  }

  Handler get handler {
    final router = Router();

    final health = HealthController();

    router.get('/', (Request request) {
        return Response.ok('Get request');
    });

    router.get('/healthz', health.getHealth);

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
