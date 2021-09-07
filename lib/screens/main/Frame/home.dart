import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';
import 'package:winlife_conselor_flutter/controller/main_controller.dart';

class FrameHome extends StatefulWidget {
  const FrameHome({Key? key}) : super(key: key);

  @override
  _FrameHomeState createState() => _FrameHomeState();
}

class _FrameHomeState extends State<FrameHome> {
  final MainController _mainController = Get.find();

  SolidController _controller = SolidController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container()));
  }
}
