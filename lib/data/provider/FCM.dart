import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FCM {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Stream<RemoteMessage> onMessage = FirebaseMessaging.onMessage;

  static Future<void> saveTokenToDatabase(String token, String email) async {
    // Assume user is logged in for this example

    await FirebaseFirestore.instance.collection('users').doc(email).set({
      'tokens': FieldValue.arrayUnion([token]),
    });
  }

  static Future<dynamic> send(String token, Map<String, dynamic> data,
      {Map<String, dynamic>? notif}) async {
    String url = "https://fcm.googleapis.com/fcm/send";
    final body = {
      "message": {"token": token, "data": data, "notification": notif}
    };
    final res = await http
        .post(Uri.parse(url), body: convert.jsonEncode(body), headers: {
      "Content-Type": "application/json",
      "Authorization":
          "key=AAAAeevnBNc:APA91bEaMSFMd_Sms2e8uDhIXsd2CMKFSBiNB-8fgqEjRp5puN-Z3ZYgZNN4I_6khCi1WIPsDZVQWx1valVQpbod3Dlt6QGrU8t7Dt2Icxjf7NbV-w4Ofr2GR3Ano8BoltTLR5XXQ7U2",
    });
    final result = await compute(convert.jsonDecode, res.body);
    return result;
  }
}
