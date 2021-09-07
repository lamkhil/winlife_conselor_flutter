import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:winlife_conselor_flutter/data/provider/api.dart';

class HttpService {
  //AUTH =======================================================================
  static Future<dynamic> register(
      String name, String email, String password, String mobileNumber) async {
    try {
      String url = Api.REGISTER;

      final res = await http.post(Uri.parse(url), body: {
        "email": email,
        "password": password,
        "mobile_number": mobileNumber,
        "name": name
      }, headers: {
        "x-api-key": Api.API_KEY,
      });
      final result = await compute(convert.jsonDecode, res.body);
      return result;
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> login(String email, String password) async {
    String url = Api.LOGIN;

    final res = await http.post(Uri.parse(url), body: {
      "username": email,
      "password": password,
    }, headers: {
      "x-api-key": Api.API_KEY,
    });
    final result = await compute(convert.jsonDecode, res.body);
    print(result);
    return result;
  }

  static Future<UserCredential?> signIngWithGoogle() async {
    final GoogleSignIn googleSignIn = new GoogleSignIn();

    GoogleSignInAccount? googleuser =
        await GoogleSignIn(scopes: <String>['email']).signIn();
    if (googleuser == null) {
      return null;
    }
    GoogleSignInAuthentication googleAuth = await googleuser.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    var user = await FirebaseAuth.instance.signInWithCredential(credential);
    googleSignIn.disconnect();
    return user;
  }

  static Future<UserCredential?> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ["email", "public_profile", "user_friends"]);
    // Create a credential from the access token
    print(loginResult.message);
    if (loginResult.status == LoginStatus.success) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
    return null;
  }

  //HOME =======================================================================

  static Future<dynamic> getAllKategori(String token) async {
    try {
      String url = Api.KATEGORI;

      final res = await http.get(Uri.parse(url),
          headers: {"x-api-key": Api.API_KEY, "x-token": token});
      final result = await compute(convert.jsonDecode, res.body);
      return result;
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> getAllConselor(String token) async {
    try {
      String url = Api.KONSELOR;

      final res = await http.get(Uri.parse(url),
          headers: {"x-api-key": Api.API_KEY, "x-token": token});
      final result = await compute(convert.jsonDecode, res.body);
      return result;
    } catch (e) {
      return null;
    }
  }
}
