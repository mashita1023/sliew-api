import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class HealthController {
  HealthController() {
    return;
  }

  getHealth(Request request) {
    return Response.ok('Get request');
  }
}
