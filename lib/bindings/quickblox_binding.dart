import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/controller/quickblox_controller.dart';

class QBBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(QBController());
  }
}
