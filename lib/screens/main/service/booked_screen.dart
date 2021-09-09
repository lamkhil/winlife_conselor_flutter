import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickblox_sdk/webrtc/constants.dart';
import 'dart:convert' as convert;

import 'package:winlife_conselor_flutter/constant/color.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/controller/chat_controller.dart';
import 'package:winlife_conselor_flutter/controller/quickblox_controller.dart';
import 'package:winlife_conselor_flutter/controller/rtc_controller.dart';
import 'package:winlife_conselor_flutter/data/provider/FCM.dart';
import 'package:winlife_conselor_flutter/routes/app_routes.dart';

class BookedScreen extends StatefulWidget {
  const BookedScreen({Key? key}) : super(key: key);

  @override
  _BookedScreenState createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  var args = Get.arguments;
  late var user;
  late var time;

  QBController _qbController = Get.find();
  AuthController _authController = Get.find();
  late ChatController _chatController;
  late RTCController _rtcController;

  @override
  void initState() {
    if (args['type'].toString().toLowerCase() == 'chat') {
      _chatController = Get.find();
    } else {
      _rtcController = Get.find();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = convert.jsonDecode(args['user']);
    time = convert.jsonDecode(args['time']);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          child: Container(
            padding: const EdgeInsets.only(left: 25, top: 0, right: 25),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                child: Text(
                              "Order Incoming!",
                              style: TextStyle(
                                  fontFamily: 'neosansbold', fontSize: 24),
                            )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Status : Paid",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'muli', fontSize: 18),
                                )),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 30, left: 10, bottom: 10),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(
                                            2, 6), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                child: InkWell(
                                  child: Center(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(18),
                                        child: Image.network(
                                          "https://picsum.photos/id/1005/367/267",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  onTap: () {},
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: 90,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(user['full_name'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'neosansbold',
                                            fontSize: 18,
                                          )),
                                      Container(
                                        margin: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          user['email'],
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      // Container(
                                      //   margin: const EdgeInsets.only(top: 4),
                                      //   child: Text(
                                      //     "Rate: 4,5",
                                      //     textAlign: TextAlign.center,
                                      //   ),
                                      // ),
                                    ])),

                            // Container(
                            //     child: Row(
                            //   children: [
                            //     Expanded(
                            //       child: Text(
                            //         "Payment Status ",
                            //         style: TextStyle(
                            //             fontFamily: 'neosansbold',
                            //             fontSize: 15),
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: Text(
                            //         response['payment_status']
                            //             .toString(),
                            //         textAlign: TextAlign.right,
                            //         style: TextStyle(
                            //             fontFamily: 'muli',
                            //             fontSize: 15),
                            //       ),
                            //     ),
                            //   ],
                            // )),

                            //================================================
                            Container(
                                child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Type Konsultasi ",
                                    style: TextStyle(
                                        fontFamily: 'neosansbold',
                                        fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    args['type'],
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontFamily: 'muli', fontSize: 15),
                                  ),
                                ),
                              ],
                            )),

                            //================================================

                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Waktu Konsultasi ",
                                        style: TextStyle(
                                            fontFamily: 'neosansbold',
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        time['time'],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'muli', fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )),
                            //================================================
                            //
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey[500],
                            ),
                            Container(
                                child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Harga",
                                    style: TextStyle(
                                        fontFamily: 'neosansbold',
                                        fontSize: 18),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "IDR ",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'mulibold',
                                            fontSize: 15),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          "90.000",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontFamily: 'muli', fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                            InkWell(
                              onTap: () async {
                                switch (args['type'].toString().toLowerCase()) {
                                  case 'chat':
                                    await _chatController.createDialog(
                                        int.parse(args['qb'].toString()));
                                    Map<String, dynamic> data = {
                                      'type': args['type'],
                                      'dialogId': _chatController.dialog!.id!,
                                      'user': _authController.user.toJson()
                                    };
                                    FCM.send(args['fcm'], data);
                                    Get.toNamed(Routes.CHATSCREEN,
                                        arguments: {'user': user});
                                    break;
                                  case 'phone':
                                    await _rtcController.callWebRTC(
                                        QBRTCSessionTypes.AUDIO,
                                        int.parse(args['qb'].toString()));
                                    Map<String, dynamic> data = {
                                      'type': args['type'],
                                      'session': _rtcController.sessionId,
                                      'user': _authController.user.toJson(),
                                    };
                                    FCM.send(args['fcm'], data);
                                    Get.toNamed(Routes.CALLSCREEN,
                                        arguments: {'user': user});
                                    break;
                                  case 'vidcall':
                                    break;
                                  default:
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 0.8,
                                        blurRadius: 5,
                                        offset: Offset(
                                            2, 5), // changes position of shadow
                                      ),
                                    ],
                                    color: mainColor,
                                    border: Border.all(
                                      color: mainColor,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                padding: const EdgeInsets.all(13),
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Mulai Konsultasi",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'neosansbold',
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
