import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:password_strength/password_strength.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/routes/app_routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final co_email = new TextEditingController();
  final co_name = new TextEditingController();
  final co_password = new TextEditingController();
  final co_phone = new TextEditingController();

  AuthController _authController = Get.find();

  var _obscureText = true.obs;
  String strangepass = '';
  bool strangeAgree = false;
  var strength = 0.0.obs;
  var agree = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    co_password.addListener(textListener);
    super.initState();
  }

  bool validateUpperCase(String value) {
    String pattern = '[A-Z]';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateLowerCase(String value) {
    String pattern = '[a-z]';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateSpecialCharacter(String value) {
    String pattern = '[^A-Za-z]';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    co_email.dispose();
    co_name.dispose();
    co_password.dispose();
    co_phone.dispose();
    super.dispose();
  }

  void _toggle() {
    _obscureText.value = !_obscureText.value;
  }

  textListener() {
    // Estimate the password's strength.
    strength.value = estimatePasswordStrength(co_password.text);

    print('Please enter a password:' + strength.toString());
    // Print a response
    if (!validateUpperCase(co_password.text)) {
      strangepass = 'Minimum 1 upper case';
      strength.value = 0.2;
    } else if (!validateLowerCase(co_password.text)) {
      strangepass = 'Minimum 1 lower case';
      strength.value = 0.2;
    } else if (!validateSpecialCharacter(co_password.text)) {
      strangepass = 'Minimum 1 Special Character or Numeric Number';
      strength.value = 0.2;
    } else if (strength < 0.3) {
      strangepass = 'This password is weak!';
    } else if (strength < 0.7) {
      strangepass = 'This passsword is strong!';
    } else {
      strangepass = 'This passsword is strong!';
    }
  }

  @override
  Widget build(BuildContext context) {
    var ls = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: new Image.asset("assets/logo-ls.png"),
                      ),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: double.infinity,
                  child: Text(
                    "register".tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "NeoSansBold", fontSize: 25),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 35),
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  width: double.infinity,
                  child: Text(
                    "NAME".tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "mulilight", fontSize: 12),
                  )),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 0),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: co_name,
                          decoration: InputDecoration(
                            hintText: 'Input your name',
                          ),
                        ),
                      ))
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  width: double.infinity,
                  child: Text(
                    "MOBILE NUMBER".tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "mulilight", fontSize: 12),
                  )),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 0),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        margin: const EdgeInsets.only(top: 0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          enabled: false,
                          // controller: co_telp,
                          style: TextStyle(color: Colors.black),
                          initialValue: "+62",
                          decoration: const InputDecoration(
                            hintText: '+62',
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          autofocus: false,
                          controller: co_phone,
                          decoration: const InputDecoration(
                            hintText: '81xxxxxxx',
                          ),
                        ),
                      ))
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  width: double.infinity,
                  child: Text(
                    "EMAIL",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "mulilight", fontSize: 12),
                  )),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 1),
                child: TextFormField(
                  controller: co_email,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: const InputDecoration(
                    hintText: 'example@gmail.com',
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  width: double.infinity,
                  child: Text(
                    "PASSWORD".tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "mulilight", fontSize: 12),
                  )),
              Obx(
                () => Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  margin: const EdgeInsets.only(top: 1),
                  child: Stack(
                    children: [
                      Container(
                        child: TextFormField(
                          controller: co_password,
                          obscureText: _obscureText.value,
                          autofocus: false,
                          decoration: const InputDecoration(
                            hintText: 'Input Password',
                          ),
                        ),
                      ),
                      Positioned(
                          top: 10,
                          right: 5,
                          child: InkWell(
                              onTap: () {
                                _toggle();
                              },
                              child: new Icon(
                                _obscureText.value
                                    ? FontAwesomeIcons.solidEye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 18,
                                color: _obscureText.value
                                    ? Colors.grey
                                    : Colors.green,
                              ))),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  width: double.infinity,
                  child: Obx(
                    () => Text(
                      strangepass.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: "mulilight",
                        fontSize: 10,
                        color: strength < 0.3 ? Colors.red : Colors.green,
                      ),
                    ),
                  )),
              Container(
                padding: const EdgeInsets.only(
                    right: 0, left: 0, top: 20, bottom: 0),
                child: Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: agree.value,
                          onChanged: (value) {
                            agree.value = value!;
                          }),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                right: 10, left: 0, top: 0, bottom: 5),
                            child: Text(
                              'byLogin'.tr,
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontFamily: 'muli', fontSize: 14),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 0, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   new MaterialPageRoute(
                                    //       builder: (context) => new HtmlView(
                                    //           "Syarat ketentuan", "ketentuanlayanan")),
                                    // );
                                  },
                                  child: Text(
                                    'terms'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'MuliBold',
                                        fontSize: 14,
                                        color: mainColor),
                                  ),
                                ),
                                Text(
                                  'and'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'MuliLight', fontSize: 14),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   new MaterialPageRoute(
                                    //       builder: (context) => new HtmlView(
                                    //           "Kebijakan Privasi", "kebijakanprivasi")),
                                    // );
                                  },
                                  child: Text(
                                    'privacy'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'MuliBold',
                                        fontSize: 14,
                                        color: mainColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Obx(
                  () => Container(
                      width: double.infinity,
                      height: 45,
                      margin: const EdgeInsets.only(top: 30),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.0),
                        child: Material(
                          color: agree.value ? mainColor : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                          shadowColor: agree.value ? mainColor : Colors.grey,
                          elevation: 5.0,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 0.0,
                            minWidth: 200.0,
                            height: 50.0,
                            onPressed: agree.value
                                ? () {
                                    _authController.register(
                                        context,
                                        co_name.text,
                                        co_email.text,
                                        co_password.text,
                                        co_phone.text,
                                        strength.value);
                                  }
                                : null,
                            color: mainColor,
                            child: Text('REGISTER'.tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: 'mulibold')),
                          ),
                        ),
                      )),
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 55,
                  margin: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Get.offNamed(Routes.LOGIN);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already'.tr,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontFamily: 'muli'),
                          ),
                          Text(
                            'login'.tr + " " + 'here'.tr,
                            style: TextStyle(
                                fontSize: 15,
                                color: mainColor,
                                fontFamily: 'mulibold'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
