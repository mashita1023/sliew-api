import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../entity/export.dart';

class UserController {
  var userUsecase;

  UserController(this.userUsecase);
  
  getUser(Request request, String id) {
    User user = userUsecase.getUser(request.context, int.parse(id));
    String json = user.encode;
    return Response.ok(json);
  }
}
