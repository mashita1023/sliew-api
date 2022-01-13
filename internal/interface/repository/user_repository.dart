import '../../usecase/repository/user_repository.dart';
import './external/database.dart';
import '../../entity/export.dart';

class UserRepositoryImpl implements UserRepository {

  Database database;
  
  UserRepositoryImpl(this.database);

  Future<User> getUser(ctx, id) async {
    String sql = '''
SELECT * FROM users WHERE id=${id}
''';
    var user = await database.select(ctx, sql);

    return user;
  }
}
