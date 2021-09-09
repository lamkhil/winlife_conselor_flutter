import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/routes/app_routes.dart';

class RegisterSocialPage extends StatefulWidget {
  const RegisterSocialPage({Key? key}) : super(key: key);

  @override
  _RegisterSocialPageState createState() => _RegisterSocialPageState();
}

class _RegisterSocialPageState extends State<RegisterSocialPage> {
  final co_phone = new TextEditingController();

  AuthController _authController = Get.find();
  var agree = false.obs;

  @override
  void dispose() {
    co_phone.dispose();
    super.dispose();
  }

  var args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var ls = MediaQuery.of(context).devicePixelRatio;
    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
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
                      "Register ",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: "NeoSansBold", fontSize: 25),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(left: 5, right: 10),
                    width: double.infinity,
                    child: Text(
                      "MOBILE NUMBER ",
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
                                'By Logging in or Registering, you agree to WinLife',
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontFamily: 'muli', fontSize: 14),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 0, right: 10),
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
                                      'Terms of Service',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'MuliBold',
                                          fontSize: 14,
                                          color: mainColor),
                                    ),
                                  ),
                                  Text(
                                    'And ',
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
                                      'Privacy Policy ',
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
                                  ? () async {
                                      await _authController.socialSignIn(
                                          args['user'],
                                          args['name'],
                                          args['email']);
                                      await _authController.register(
                                          context,
                                          args['name'],
                                          args['email'],
                                          args['key'],
                                          co_phone.text,
                                          0.5);
                                    }
                                  : null,
                              color: mainColor,
                              child: Text('CONTINUE',
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
                              'Already have an Account? ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontFamily: 'muli'),
                            ),
                            Text(
                              'Login Here',
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
          ))),
    );
  }

  Future<bool> _onBackPress() async {
    FirebaseAuth user = FirebaseAuth.instance;
    user.signOut();
    print("sign out");
    return true;
  }
}
