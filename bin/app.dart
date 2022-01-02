import '../internal/external/server/server.dart';

void main() async {
  final server = Server();
  await server.run();

  print(server.server.runtimeType);
}

