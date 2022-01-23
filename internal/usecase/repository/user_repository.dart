import '../../entity/export.dart';

abstract class UserRepository {
  Future<User> getUser(ctx, id);
  Future<User> insertUser(ctx, name);
  Future<User> updateUser(ctx, user);
  Future<User> deleteUser(ctx, user);
}
