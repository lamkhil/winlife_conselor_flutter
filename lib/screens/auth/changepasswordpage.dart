import 'package:flutter/material.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController pass = new TextEditingController();
  TextEditingController pass2 = new TextEditingController();
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
                    "Change Password ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "NeoSansBold", fontSize: 25),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 35),
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  width: double.infinity,
                  child: Text(
                    "PASSWORD",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "mulilight", fontSize: 12),
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
              Container(
                  margin: const EdgeInsets.only(top: 35),
                  padding: const EdgeInsets.only(left: 5, right: 10),
                  width: double.infinity,
                  child: Text(
                    "CONFIRM PASSWORD",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: "mulilight", fontSize: 12),
                  )),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.only(top: 1),
                child: TextFormField(
                  controller: pass2,
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
              Center(
                child: Container(
                    width: double.infinity,
                    height: 15 * ls,
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
                          height: 50.0,
                          onPressed: () {
                            //_RestLogin();
                          },
                          color: mainColor,
                          child: Text('CONTINUE',
                              style: TextStyle(
                                  fontSize: 5 * ls,
                                  color: Colors.white,
                                  fontFamily: 'mulibold')),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        )));
  }
}
