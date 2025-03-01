import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/auth/auth_controller.dart';

class AuthControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
