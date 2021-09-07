import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:winlife_conselor_flutter/bindings/auth_binding.dart';
import 'package:winlife_conselor_flutter/routes/app_page.dart';
import 'package:winlife_conselor_flutter/setting/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WINLIFE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
      getPages: AppPages.pages,
      initialBinding: AuthBindings(),
      locale: LanguageService.locale,
      fallbackLocale: LanguageService.fallbackLocale,
      translations: LanguageService(),
    );
  }
}
