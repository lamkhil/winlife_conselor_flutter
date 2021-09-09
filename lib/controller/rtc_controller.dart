import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quickblox_sdk/models/qb_rtc_session.dart';
import 'package:quickblox_sdk/quickblox_sdk.dart';
import 'package:quickblox_sdk/webrtc/constants.dart';

class RTCController extends GetxController {
  StreamSubscription? _callSubscription;
  StreamSubscription? _callEndSubscription;
  StreamSubscription? _rejectSubscription;
  StreamSubscription? _acceptSubscription;
  StreamSubscription? _hangUpSubscription;
  StreamSubscription? _videoTrackSubscription;
  StreamSubscription? _notAnswerSubscription;
  StreamSubscription? _peerConnectionSubscription;

  var vidiocall = false;
  String? sessionId;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    try {
      await QB.webrtc.init();
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
    }
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    try {
      await QB.webrtc.release();
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
    }
    super.onClose();
  }

  Future<void> subscribeCall() async {
    if (_callSubscription != null) {
      return;
    }

    try {
      _callSubscription =
          await QB.webrtc.subscribeRTCEvent(QBRTCEventTypes.CALL, (data) {
        Map<dynamic, dynamic> payloadMap =
            Map<dynamic, dynamic>.from(data["payload"]);

        Map<dynamic, dynamic> sessionMap =
            Map<dynamic, dynamic>.from(payloadMap["session"]);

        String sessionId = sessionMap["id"];
        int initiatorId = sessionMap["initiatorId"];
        int callType = sessionMap["type"];

        if (callType == QBRTCSessionTypes.AUDIO) {
          vidiocall = false;
        } else {
          vidiocall = true;
        }

        sessionId = sessionId;
        String messageCallType = vidiocall ? "Video" : "Audio";
      }, onErrorMethod: (error) {});
    } on PlatformException catch (e) {}
  }

  Future<void> callWebRTC(int sessionType, int opponent) async {
    try {
      QBRTCSession? session = await QB.webrtc.call([opponent], sessionType);
      sessionId = session!.id;
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> acceptWebRTC(String sessionId) async {
    try {
      QBRTCSession? session = await QB.webrtc.accept(sessionId);
      String? receivedSessionId = session!.id;
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> rejectWebRTC(String sessionId) async {
    try {
      QBRTCSession? session = await QB.webrtc.reject(sessionId);
      String? id = session!.id;
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> hangUpWebRTC() async {
    try {
      QBRTCSession? session = await QB.webrtc.hangUp(sessionId!);
      String? id = session!.id;
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
