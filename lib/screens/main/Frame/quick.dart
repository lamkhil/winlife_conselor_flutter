import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class FrameQuick extends StatefulWidget {
  const FrameQuick({Key? key}) : super(key: key);

  @override
  _FrameQuickState createState() => _FrameQuickState();
}

class _FrameQuickState extends State<FrameQuick> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _refresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Color(0xff35B85A),
          title: Center(
            child: Text(
              "Konsultasi",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'neosansbold', color: Colors.white),
            ),
          ),
        ),
        body: SafeArea(child: Container()));
  }
}
