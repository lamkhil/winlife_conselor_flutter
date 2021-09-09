import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quickblox_sdk/quickblox_sdk.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/controller/quickblox_controller.dart';

class ChatController extends GetxController {
  final QBController _qbController = Get.find();
  final AuthController _authController = Get.find();

  Future<void> connect() async {
    try {
      await QB.chat
          .connect(_qbController.qbUser!.id!, _qbController.qbUser!.email!);
      print("Chat Connect");
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void disconnect() async {
    try {
      await QB.chat.disconnect();
      print("Chat Disconnect");
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<bool?> isConnected() async {
    bool? connected = false;
    try {
      connected = await QB.chat.isConnected();
    } on PlatformException catch (e) {
      print(e);
    }
    return connected;
  }
}
