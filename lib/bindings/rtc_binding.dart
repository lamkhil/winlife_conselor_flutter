import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/controller/rtc_controller.dart';

class RTCBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RTCController());
  }
}
