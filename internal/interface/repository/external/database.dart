import '../../../entity/user.dart';

abstract class Database {
  Future<User> select();
}
