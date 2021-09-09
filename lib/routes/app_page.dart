import 'package:get/get.dart';
import 'package:winlife_conselor_flutter/bindings/main_binding.dart';
import 'package:winlife_conselor_flutter/routes/app_routes.dart';
import 'package:winlife_conselor_flutter/screens/auth/landingpage.dart';
import 'package:winlife_conselor_flutter/screens/auth/loginpage.dart';
import 'package:winlife_conselor_flutter/screens/auth/lupapassword.dart';
import 'package:winlife_conselor_flutter/screens/auth/otppage.dart';
import 'package:winlife_conselor_flutter/screens/auth/registerSocialPage.dart';
import 'package:winlife_conselor_flutter/screens/auth/registerpage.dart';
import 'package:winlife_conselor_flutter/screens/main/dashboard.dart';
import 'package:winlife_conselor_flutter/screens/main/service/booked_screen.dart';
import 'package:winlife_conselor_flutter/screens/splashscreen.dart';
import 'package:winlife_conselor_flutter/screens/webview.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(name: Routes.LANDING, page: () => LandingPage()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.REGISTERSOCIAL,
      page: () => RegisterSocialPage(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OTPVerification(),
    ),
    GetPage(
      name: Routes.FORGETPASSWORD,
      page: () => LupaPasswordPage(),
    ),
    GetPage(
      name: Routes.CHANGEPASSWORD,
      page: () => LupaPasswordPage(),
    ),
    GetPage(
        name: Routes.MAIN,
        page: () => DashboardPage(),
        binding: MainBindings()),
    GetPage(name: Routes.WEBVIEW, page: () => WebViewPage()),
    GetPage(name: Routes.BOOKEDSCREEN, page: () => BookedScreen()),
  ];
}
