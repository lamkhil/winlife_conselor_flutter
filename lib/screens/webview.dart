import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final args = Get.arguments;
  String url = '';
  String title = '';
  @override
  void initState() {
    if (args != null && args is List) {
      url = args[0];
      title = args[1];
    }
    // TODO: implement initState
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  var isLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: url,
            onPageFinished: (finish) => isLoading.value = false,
          ),
          Obx(
            () => Visibility(
              visible: isLoading.value,
              child: Center(
                child: SpinKitFadingCircle(
                  color: mainColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
