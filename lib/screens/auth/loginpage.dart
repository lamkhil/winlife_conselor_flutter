import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  AuthController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();
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
                    'login'.tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "NeoSansBold", fontSize: 25),
                  )),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 35),
                          padding: const EdgeInsets.only(left: 5, right: 10),
                          width: double.infinity,
                          child: Text(
                            "EMAIL",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: "mulilight", fontSize: 12),
                          )),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 0),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              controller: user,
                              decoration: const InputDecoration(
                                hintText: 'user@email.com',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                } else if (!GetUtils.isEmail(value)) {
                                  return 'Invalid Email';
                                }
                                return null;
                              },
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 35),
                          padding: const EdgeInsets.only(left: 5, right: 10),
                          width: double.infinity,
                          child: Text(
                            "PASSWORD".tr,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: "mulilight", fontSize: 12),
                          )),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        margin: const EdgeInsets.only(top: 1),
                        child: TextFormField(
                          controller: pass,
                          obscureText: true,
                          autofocus: false,
                          decoration: const InputDecoration(
                            hintText: 'Input Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )),
              Center(
                child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.0),
                      child: Material(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(5),
                        shadowColor: mainColor,
                        elevation: 5.0,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 0.0,
                          minWidth: 200.0,
                          height: 40.0,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _authController.login(
                                  context, user.text, pass.text);
                            }
                          },
                          color: mainColor,
                          child: Text('CONTINUE'.tr,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: 'mulibold')),
                        ),
                      ),
                    )),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 45,
                  margin: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Get.offNamed(Routes.REGISTER);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'no akun'.tr + ' ',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontFamily: 'muli'),
                          ),
                          Text(
                            'register'.tr + ' ' + 'here'.tr,
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
              Container(
                  height: 40,
                  margin: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.FORGETPASSWORD);
                        },
                        child: Text(
                          "forgot".tr,
                          style: TextStyle(
                              fontFamily: 'mulibold', color: mainColor),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        )));
  }
}
