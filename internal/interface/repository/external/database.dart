import '../../../entity/user.dart';

abstract class Database {
  Future<Map<String, dynamic>> single(ctx, sql);
  Future<Map<String, dynamic>> insert(ctx, sql);
}
