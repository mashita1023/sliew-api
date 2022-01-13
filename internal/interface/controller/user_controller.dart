import 'dart:convert';
import 'package:shelf/shelf.dart';

import '../../entity/export.dart';

class UserController {
  var statusResponse;
  var userUsecase;

  UserController(this.statusResponse, this.userUsecase);
  
  getUser(Request request, String id) async{
    try {
      User user = await userUsecase.getUser(request.context, int.parse(id));

      String json = user.encode;
      return statusResponse.responseOK(json);
      
    } on Exception catch(e, st) {
      print(e);
//      print(st);
      return statusResponse.responseBadRequest("Bad Request\n$st");
    }
  }
}
