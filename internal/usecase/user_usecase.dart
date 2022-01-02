import '../entity/export.dart';

class UserUsecase {
  UserUsecase();

  User getUser(ctx, int id) {
    User user = User(id, "taro");
    return user;
  }
}
