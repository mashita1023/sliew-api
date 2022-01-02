import '../external/server/server.dart';
import '../external/server/router.dart';
import '../interface/controller/health_controller.dart';
import '../interface/controller/user_controller.dart';
import '../usecase/user_usecase.dart';

initializeServer() {
  final userUsecase = UserUsecase();
  final healthController = HealthController();
  final userController = UserController(userUsecase);
  final service = Service(healthController, userController);
  final server = Server(service);

  return server;
}
