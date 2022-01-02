import '../external/server/server.dart';
import '../external/server/router.dart';
import '../interface/controller/health_controller.dart';
import '../interface/controller/user_controller.dart';
import '../usecase/user_usecase.dart';
import '../config/http_status.dart';

initializeServer() {
  final statusResponse = StatusResponse();
  final userUsecase = UserUsecase();
  final healthController = HealthController();
  final userController = UserController(statusResponse, userUsecase);
  final service = Service(healthController, userController);
  final server = Server(service);

  return server;
}
