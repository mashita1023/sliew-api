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
    var data = await database.single(ctx, sql);

    User user = User(data['id'], data['name']);
    return user;
  }

  Future<int> insertUser(ctx, name) async {
    print("repository");
    String sql = '''
INSERT INTO users (name) VALUES ("$name");
''';

    var data = await database.insert(ctx, sql);

    return data["id"];
  }
}
