import '../../entity/export.dart';

abstract class UserRepository {
  Future<User> getUser(ctx, id);
  Future<int> insertUser(ctx, name);
}
