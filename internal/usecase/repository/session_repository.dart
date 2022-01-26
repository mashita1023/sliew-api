import '../../entity/export.dart';

abstract class SessionRepository {
  Future<List<Session>> getSessions(ctx);
  Future<Session> getSession(ctx, int id);
  Future<Session> insertSession(ctx, Session req);
  Future<Session> updateSession(ctx, Session session);
  Future<Session> deleteSession(ctx, Session session);
}
