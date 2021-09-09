import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quickblox_sdk/chat/constants.dart';
import 'package:quickblox_sdk/models/qb_attachment.dart';
import 'package:quickblox_sdk/models/qb_dialog.dart';
import 'package:quickblox_sdk/quickblox_sdk.dart';
import 'package:uuid/uuid.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/controller/quickblox_controller.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:winlife_conselor_flutter/data/model/user_model.dart';

class ChatController extends GetxController {
  final QBController _qbController = Get.find();
  final AuthController _authController = Get.find();
  QBDialog? dialog;
  String? _messageId;
  Map<dynamic, dynamic> payload = {}.obs;
  StreamSubscription? _newMessageSubscription;
  StreamSubscription? _systemMessageSubscription;
  StreamSubscription? _deliveredMessageSubscription;
  StreamSubscription? _readMessageSubscription;
  StreamSubscription? _userTypingSubscription;
  StreamSubscription? _userStopTypingSubscription;
  StreamSubscription? _connectedSubscription;
  StreamSubscription? _connectionClosedSubscription;
  StreamSubscription? _reconnectionFailedSubscription;
  StreamSubscription? _reconnectionSuccessSubscription;
  RxList<types.Message> messages = RxList<types.Message>();
  UserData? opponent;
  var opponentAuthor;
  @override
  Future<void> onInit() async {
    super.onInit();
    await connect();
  }

  @override
  Future<void> onClose() async {
    // TODO: implement onClose
    // ;
    deleteDialog();
    unsubscribeNewMessage();
    unsubscribeSystemMessage();
    super.onClose();
  }

  Future<void> connect() async {
    try {
      await QB.chat
          .connect(_qbController.qbUser!.id!, _authController.user.email);
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

  Future<void> sendMessage(String message) async {
    List<QBAttachment>? attachments = [];
    Map<String, String>? properties = Map();
    bool markable = false;
    String dateSent = "DateTime.now().toString()";
    bool saveToHistory = true;

    try {
      await QB.chat.sendMessage(dialog!.id!,
          body: message, markable: markable, saveToHistory: saveToHistory);
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
      print(e);
    }
  }

  Future<void> createDialog(int opponentID) async {
    List<int> occupantsIds = [opponentID];
    String dialogName = "FLUTTER_CHAT_" + DateTime.now().millisecond.toString();

    int dialogType = QBChatDialogTypes.CHAT;

    try {
      dialog = await QB.chat
          .createDialog(occupantsIds, dialogName, dialogType: dialogType);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void deleteDialog() async {
    try {
      await QB.chat.deleteDialog(dialog!.id!);
      dialog = null;
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void subscribeNewMessage() async {
    if (_newMessageSubscription != null) {
      return;
    }
    try {
      _newMessageSubscription = await QB.chat
          .subscribeChatEvent(QBChatEvents.RECEIVED_NEW_MESSAGE, (data) {
        Map<dynamic, dynamic> map = Map<dynamic, dynamic>.from(data);
        print(map);
        payload = Map<dynamic, dynamic>.from(map["payload"]);
        _messageId = payload["id"] as String;
        print("Received message: \n ${payload["body"]}");
        final textMessage = types.TextMessage(
          author: opponentAuthor,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text: payload["body"],
        );
      }, onErrorMethod: (error) {
        print(error);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void subscribeSystemMessage() async {
    if (_systemMessageSubscription != null) {
      return;
    }
    try {
      _systemMessageSubscription = await QB.chat
          .subscribeChatEvent(QBChatEvents.RECEIVED_SYSTEM_MESSAGE, (data) {
        Map<dynamic, dynamic> map = Map<dynamic, dynamic>.from(data);

        Map<dynamic, dynamic> payload =
            Map<dynamic, dynamic>.from(map["payload"]);

        _messageId = payload["id"];

        print("Received system message");
      }, onErrorMethod: (error) {
        print(error);
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void unsubscribeNewMessage() {
    if (_newMessageSubscription != null) {
      _newMessageSubscription!.cancel();
      _newMessageSubscription = null;
    }
  }

  void unsubscribeSystemMessage() {
    if (_systemMessageSubscription != null) {
      _systemMessageSubscription!.cancel();
      _systemMessageSubscription = null;
    }
  }
}
