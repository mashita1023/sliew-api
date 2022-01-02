import '../entity/export.dart';

class UserUsecase {
  UserUsecase();

  User getUser(ctx, int id) {
    print("taro");
    User user = User(id, "taro");
    return user;
  }
}
