import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageService extends Translations {
  static final locale = Locale('id', 'ID');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en', 'US');

  static final locales = [Locale('id', 'ID'), Locale('en', 'US')];

  static final langs = ['id', 'en'];

  Map<String, Map<String, String>> get keys => {'id_ID': idID, 'en_US': enUS};

  // Gets locale from language, and updates the locale
  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}

const Map<String, String> idID = {
  'welcome': 'Selamat Datang di Winlife',
  'welcome sub':
      'Kami membantu Anda menemukan solusi untuk masalah Anda, karena Anda berharga & lebih dari pemenang!',
  'login': 'Masuk',
  'register': 'Daftar',
  'or continue with': 'atau lanjutkan dengan',
  'facebook': 'Lanjutkan dengan Facebook',
  'google': 'Lanjutkan dengan Google',
  'byLogin': 'Dengan Masuk atau Mendaftar, Anda setuju kepada',
  'terms': 'Persyaratan Layanan ',
  'and': 'dan ',
  'privacy': 'Kebijakan pribadi',
  'pilih bahasa': 'Pilih bahasa Anda',
  'PASSWORD': 'KATA SANDI',
  'CONTINUE': 'LANJUTKAN',
  'no akun': "Tidak punya akun?",
  'here': 'disini',
  'forgot': 'Lupa Password',
  'NAME': 'NAMA',
  'MOBILE NUMBER': 'NOMOR TELEPON',
  'already': 'Sudah punya akun? '
};

const Map<String, String> enUS = {
  'welcome': 'Welcome To WinLife',
  'welcome sub':
      'We help you to find solution for yout problem,\nbecause you are valueable & more than winner!',
  'login': 'Login',
  'register': 'Register',
  'or continue with': 'or continue with',
  'facebook': 'Continue With Facebook',
  'google': 'Continue With Google',
  'byLogin': 'By Logging in or Registering, you agree to',
  'terms': 'Terms of Service',
  'and': 'And ',
  'privacy': 'Privacy Policy',
  'pilih bahasa': 'Choose your language',
  'PASSWORD': 'PASSWORD',
  'CONTINUE': 'CONTINUE',
  'no akun': "Don't have an account?",
  'here': 'here',
  'forgot': 'Forgot Password',
  'NAME': 'NAME',
  'MOBILE NUMBER': 'MOBILE NUMBER',
  'already': 'Already have an account? '
};
