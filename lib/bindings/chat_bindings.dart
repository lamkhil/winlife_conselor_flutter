import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/controller/chat_controller.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
  }
}
