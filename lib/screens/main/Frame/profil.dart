import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';

class FrameProfile extends StatefulWidget {
  const FrameProfile({Key? key}) : super(key: key);

  @override
  _FrameProfilState createState() => _FrameProfilState();
}

class _FrameProfilState extends State<FrameProfile> {
  Future<void> _refresh() async {}
  AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Color(0xff35B85A),
          title: Center(
            child: Text(
              "Profile".tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'neosansbold', color: Colors.white),
            ),
          ),
        ),
        body: SafeArea(
            child: RefreshIndicator(
          onRefresh: _refresh,
          child: Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 220,
                          child: Image.asset(
                            'assets/bg-wallet.png',
                            gaplessPlayback: true,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 5, right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: const EdgeInsets.only(
                                            top: 0, left: 10, bottom: 10),
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.6),
                                                spreadRadius: 1,
                                                blurRadius: 8,
                                                offset: Offset(2,
                                                    6), // changes position of shadow
                                              ),
                                            ],
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18))),
                                        child: InkWell(
                                          child: Center(
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                child: _authController
                                                            .user.avatar !=
                                                        ''
                                                    ? Image.network(
                                                        _authController
                                                            .user.avatar,
                                                      )
                                                    : Container()),
                                          ),
                                          onTap: () {},
                                        )),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 5,
                                                left: 7,
                                              ),
                                              child: Text(
                                                _authController.user.fullName,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 7, top: 5),
                                              child: Text(
                                                _authController.user.email,
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 10),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    width: 100,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 20, top: 6),
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        border: Border.all(
                                                            color:
                                                                Colors.white)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              _authController
                                                                  .user.point
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'neosansbold',
                                                                  fontSize: 13),
                                                            ),
                                                            Text(
                                                              "Point".tr,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'mulilight',
                                                                  fontSize: 11),
                                                            )
                                                          ],
                                                        ),
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .caretRight,
                                                          size: 16,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 35,
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    decoration: BoxDecoration(),
                                                    child: Image.asset(
                                                      "assets/icon_banner_point.png",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: <Widget>[],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                        right: 20,
                                      ),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          FontAwesomeIcons.edit,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, top: 10, bottom: 0),
                                  width: double.infinity,
                                  child: Text(
                                    "Menu Profile".tr,
                                    style: TextStyle(
                                        fontFamily: "NeoSansBold",
                                        fontSize: 16),
                                  )),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, bottom: 10, right: 15, left: 15),
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0.5,
                                          blurRadius: 3),
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    //================================================================================

                                    //================================================================================
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.asset(
                                                  'assets/profile/privacy.png',
                                                  width: 30,
                                                )),
                                            Expanded(
                                              child: Text(
                                                "Change Password".tr,
                                                style: TextStyle(
                                                    fontFamily: "MuliBold",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                FontAwesomeIcons.chevronRight,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400]),
                                    ),
                                    //================================================================================
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.asset(
                                                  'assets/profile/myvoucher.png',
                                                  width: 30,
                                                )),
                                            Expanded(
                                              child: Text(
                                                "My Voucher".tr,
                                                style: TextStyle(
                                                    fontFamily: "MuliBold",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                FontAwesomeIcons.chevronRight,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400]),
                                    ),
                                    //================================================================================
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.asset(
                                                  'assets/profile/promo.png',
                                                  width: 30,
                                                )),
                                            Expanded(
                                              child: Text(
                                                "Promo",
                                                style: TextStyle(
                                                    fontFamily: "MuliBold",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                FontAwesomeIcons.chevronRight,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400]),
                                    ),
                                    //================================================================================
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.asset(
                                                  'assets/profile/withdraw.png',
                                                  width: 30,
                                                )),
                                            Expanded(
                                              child: Text(
                                                "Withdraw",
                                                style: TextStyle(
                                                    fontFamily: "MuliBold",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                FontAwesomeIcons.chevronRight,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400]),
                                    ),
                                    //================================================================================
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.asset(
                                                  'assets/profile/news.png',
                                                  width: 30,
                                                )),
                                            Expanded(
                                              child: Text(
                                                "News".tr,
                                                style: TextStyle(
                                                    fontFamily: "MuliBold",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                FontAwesomeIcons.chevronRight,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400]),
                                    ),
                                    //================================================================================
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.asset(
                                                  'assets/profile/cs.png',
                                                  width: 30,
                                                )),
                                            Expanded(
                                              child: Text(
                                                "Help Center".tr,
                                                style: TextStyle(
                                                    fontFamily: "MuliBold",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                FontAwesomeIcons.chevronRight,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400]),
                                    ),
                                    //================================================================================
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.asset(
                                                  'assets/profile/privacy.png',
                                                  width: 30,
                                                )),
                                            Expanded(
                                              child: Text(
                                                "Privacy Policy".tr,
                                                style: TextStyle(
                                                    fontFamily: "MuliBold",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                FontAwesomeIcons.chevronRight,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[400]),
                                    ),
                                    //================================================================================
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15),
                                                child: Image.asset(
                                                  'assets/profile/star.png',
                                                  width: 30,
                                                )),
                                            Expanded(
                                              child: Text(
                                                "Rate WinLife Apps v 1.0.0",
                                                style: TextStyle(
                                                    fontFamily: "MuliBold",
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 13),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                FontAwesomeIcons.chevronRight,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    //================================================================================
                                  ],
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(
                                    top: 5, bottom: 15, right: 15, left: 15),
                                height: 40,
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
                                child: InkWell(
                                  onTap: () {
                                    _authController.logout();
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Logout".tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'neosansbold',
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //================================================================================
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        )));
  }
}
