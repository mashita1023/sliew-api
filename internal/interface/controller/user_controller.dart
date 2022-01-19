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
      var json = jsonEncode(user.toMap);
      return statusResponse.responseOK(json);
      
    } on Exception catch(e, st) {
      print(e);
//      print(st);
      return statusResponse.responseBadRequest("Bad Request\n$st");
    }
  }

  getUsers(Request request) async{
    try {
      List<User> users = await userUsecase.getUsers(request.context);

      List<Map> list = [];
      users.forEach((user) {
          list.add(user.toMap);
      });
      var json = jsonEncode(list);
      return statusResponse.responseOK(json);
      
    } on Exception catch(e, st) {
      print(e);
//      print(st);
      return statusResponse.responseBadRequest("Bad Request\n$st");
    }
  }


  insertUser(Request request) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      if (params['name'] == null) {
        throw Exception('name params does not exist');
      }

      User user = await userUsecase.insertUser(request.context, params["name"]);

      var json = jsonEncode(user.toMap);
      return statusResponse.responseOK(json);
    } on Exception catch(e, st) {
      print(e);
      return statusResponse.responseBadRequest("Bad Request\n$st");
    }
  }

  updateUser(Request request) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      if (params['id'] == null) {
        throw Exception('id params does not exist');
      }
      
      if (params['name'] == null) {
        throw Exception('name params does not exist');
      }

      User user = await userUsecase.updateUser(request.context, User(params["id"], params["name"]));

      String json = jsonEncode(user.toMap);
      return statusResponse.responseOK(json);
    } on Exception catch(e, st) {
      print(e);
      return statusResponse.responseBadRequest("Bad Request\n$st");
    }
  }

  deleteUser(Request request, String id) async {
    try {
      final body = await request.readAsString();
      final params = jsonDecode(body);

      User user = await userUsecase.deleteUser(request.context, User(int.parse(id), ""));

      Map map = {'success': user.isDeleted};
      String json = jsonEncode(map);
      return statusResponse.responseOK(json);
    } on Exception catch(e, st) {
      print(e);
      return statusResponse.responseBadRequest("Bad Request\n$st");
    }
  }
}
