import 'dart:async';

import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  var args = Get.arguments;
  TextEditingController co_otp = new TextEditingController();
  AuthController _authController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(args['email']);
    _authController.sendOtp(context, args['email']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(Icons.close),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, top: 30),
                  child: Text(
                    "Verifikasi OTP ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "NeoSansBold", fontSize: 25),
                  )),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 10, bottom: 0),
                child: Text(
                  'Periksa Email Kamu yang berisi KODE VERIFIKASI yang dikirim ke ' +
                      args['email'],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontFamily: 'Muli', fontSize: 14),
                ),
              ),
              SizedBox(height: 8.0),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  controller: co_otp,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: '',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                width: double.infinity,
                child: MaterialButton(
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  elevation: 0.0,
                  minWidth: 200.0,
                  height: 45.0,
                  onPressed: () {
                    _authController.verifyOTP(
                        context, args['email'], args['password'], co_otp.text);
                  },
                  child: Text('Verifikasi',
                      style:
                          TextStyle(color: Colors.white, fontFamily: "Muli")),
                ),
              ),
              Container(
                width: double.infinity,
                height: 45,
                margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
                child: ArgonTimerButton(
                  initialTimer: 60, // Optional
                  height: 45.0,
                  elevation: 0,
                  width: MediaQuery.of(context).size.width * 0.45,
                  minWidth: MediaQuery.of(context).size.width * 0.30,
                  color: Colors.transparent,
                  roundLoadingShape: false,
                  borderRadius: 10.0,
                  borderSide: BorderSide(color: Colors.grey),
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'mulibold'),
                  ),
                  loader: (timeLeft) {
                    return Text("Wait | $timeLeft",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'mulibold'));
                  },
                  onTap: (startTimer, btnState) {
                    if (btnState == ButtonState.Idle) {
                      startTimer(60);
                      _authController.sendOtp(context, args['email']);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
