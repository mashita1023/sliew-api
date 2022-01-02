import '../external/server/server.dart';
import '../external/server/router.dart';
import '../interface/controller/health_controller.dart';

initializeServer() {
  final healthController = HealthController();
  final service = Service(healthController);
  final server = Server(service);

  return server;
}
