import '../entity/export.dart';
import './repository/user_repository.dart';

class UserUsecase {
  UserRepository userRepository;
  
  UserUsecase(this.userRepository);

  Future<User> getUser(ctx, int id) async {
    User user = await userRepository.getUser(ctx, id);
    return user;
  }

  Future<User> insertUser(ctx, name) async {
    print("usecase & $name");
    int id = await userRepository.insertUser(ctx, name);
    User user = User(id, name);

    User resultUser = await userRepository.getUser(ctx, id);
    if (user.name != resultUser.name) {
      print('error');
    }

    return user;
  }
}
