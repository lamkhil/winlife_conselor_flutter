import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FCM {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Stream<RemoteMessage> onMessage = FirebaseMessaging.onMessage;

  static Future<void> saveTokenToDatabase(String token, String email) async {
    // Assume user is logged in for this example

    await FirebaseFirestore.instance.collection('users').doc(email).set({
      'tokens': FieldValue.arrayUnion([token]),
    });
  }
}
