import 'dart:async';

import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/data/provider/FCM.dart';

class MainController extends GetxController {
  final AuthController _authController = Get.find();
  late StreamSubscription<String> tokenFCMsub;
  fcmInit() async {
    String? token = await FCM.messaging.getToken();
    await FCM.saveTokenToDatabase(token!, _authController.user.email);
    tokenFCMsub = FCM.messaging.onTokenRefresh.listen((event) {
      FCM.saveTokenToDatabase(event, _authController.user.email);
    });
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await fcmInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    tokenFCMsub.cancel();
    super.onClose();
  }
}
