import '../entity/export.dart';
import './repository/user_repository.dart';

class UserUsecase {
  UserRepository userRepository;
  
  UserUsecase(this.userRepository);

  Future<User> getUser(ctx, int id) async {
    User user = await userRepository.getUser(ctx, id);
    return user;
  }
}
