import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../entity/export.dart';
import '../../config/http_status.dart';

class UserController {
  var userUsecase;

  UserController(this.userUsecase);
  
  getUser(Request request, String id) {
    try {
      print('status${httpStatus["OK"].runtimeType}');
      User user = userUsecase.getUser(request.context, int.parse(id));

      String json = user.encode;
      return Response(httpStatus['OK']!, body:json);
      
    } on Exception catch(e, st) {
      print(e);
//      print(st);
      return Response(httpStatus['BadRequest']!, body:"BadRequest\n${st}");
    }
  }
}
