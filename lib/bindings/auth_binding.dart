import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
