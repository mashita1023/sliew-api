import '../../usecase/repository/user_repository.dart';
import './external/database.dart';
import '../../entity/export.dart';

class UserRepositoryImpl implements UserRepository {

  Database database;
  
  UserRepositoryImpl(this.database);

  Future<User> getUsers() async {
    var user = await database.select();

    User test = User(1, "hanako");
    return user;
  }
}
