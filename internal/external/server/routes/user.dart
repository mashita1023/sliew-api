import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserApi {
  var controller;

  UserApi(this.controller);
  
  Future<Response> _messages(Request request) async {
    return Response.ok('[]');
  }

  Router get router {
    final router = Router();
    print("user router's controller is ${controller.runtimeType}");
//    router.get('/', controller.getUser);
    router.get('/<id>', controller.getUser);

    return router;
  }
}
