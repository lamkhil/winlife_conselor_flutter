import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/routes/app_routes.dart';
import 'package:winlife_conselor_flutter/setting/language.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storage = GetStorage();
  AuthController _authController = Get.find();
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigatePage);
  }

  void navigatePage() async {
    var user = await storage.read('user');
    var lang = await storage.read('lang');
    print(lang);
    if (lang != null) {
      if (lang == 'id') {
        _authController.selectIndexLang.value = 0;
      } else {
        _authController.selectIndexLang.value = 1;
      }
      LanguageService.changeLocale(lang);
    }
    if (user == null) {
      Get.offNamed(Routes.LANDING);
    } else {
      await _authController.refreshToken();
      Get.offNamed(Routes.MAIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                      tag: "assets/logo-small.png",
                      child: Image(
                          image: AssetImage("assets/logo-ls.png"),
                          fit: BoxFit.contain,
                          height: 150,
                          width: 150)),
                ],
              ),
            ),
            Positioned(
                child: new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Text("V 1.0",
                          style: TextStyle(
                              fontFamily: "MuliLight",
                              fontSize: 11,
                              color: Colors.white)),
                    )))
          ],
        ));
  }
}
