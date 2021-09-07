import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FrameProfile extends StatefulWidget {
  const FrameProfile({Key? key}) : super(key: key);

  @override
  _FrameProfilState createState() => _FrameProfilState();
}

class _FrameProfilState extends State<FrameProfile> {
  Future<void> _refresh() async {}

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
              "Profile",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'neosansbold', color: Colors.white),
            ),
          ),
        ),
        body: Container());
  }
}
