import '../../entity/export.dart';

abstract class UserRepository {
  Future<User> getUsers();
}
