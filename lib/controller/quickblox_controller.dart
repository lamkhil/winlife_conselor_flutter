import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quickblox_sdk/auth/module.dart';
import 'package:quickblox_sdk/models/qb_filter.dart';
import 'package:quickblox_sdk/models/qb_session.dart';
import 'package:quickblox_sdk/models/qb_user.dart';
import 'package:quickblox_sdk/quickblox_sdk.dart';
import 'package:quickblox_sdk/users/constants.dart';
import 'package:winlife_conselor_flutter/controller/auth_controller.dart';
import 'package:winlife_conselor_flutter/data/provider/quickblox/credential.dart';

class QBController extends GetxController {
  QBSession? _session;
  QBUser? _qbUser;
  final AuthController _authController = Get.find();

  static QBController? _instance;

  @override
  Future<void> onInit() async {
    super.onInit();
    try {
      await QB.settings.init(APP_ID, AUTH_KEY, AUTH_SECRET, ACCOUNT_KEY);
    } on PlatformException catch (e) {
      print(e);
      // Some error occurred, look at the exception message for more details
    }
    try {
      await Future.wait([
        enableAutoReconnect(),
        enableCarbons(),
        cekSessionUser(),
      ]);

      await loginQB();
    } catch (e) {
      print(e);
    }
  }

  Future<void> cekSessionUser() async {
    try {
      QBSession? session = await QB.auth.getSession();
      if (session != null) {
        setSession = session;
      }
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
    }
  }

  Future<void> enableAutoReconnect() async {
    try {
      await QB.settings.enableAutoReconnect(true);
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
      print(e);
    }
  }

  Future<void> enableCarbons() async {
    try {
      await QB.settings.enableCarbons();
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
    }
  }

  Future<void> initStreamManagement() async {
    bool autoReconnect = true;
    int messageTimeout = 3;
    try {
      await QB.settings
          .initStreamManagement(messageTimeout, autoReconnect: autoReconnect);
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
      print(e);
    }
  }

  Future<void> loginQB() async {
    var cekUser = await cekUserQB(_authController.user.email);
    if (cekUser.isEmpty) {
      await registerQB(_authController.user.email, _authController.user.email);
    }
    try {
      QBLoginResult result = await QB.auth
          .login(_authController.user.email, _authController.user.email);
      _qbUser = result.qbUser;
      _session = result.qbSession;
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
      print(e);
    }
  }

  Future<void> logoutQB() async {
    try {
      await QB.auth.logout();
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
      print(e);
    }
  }

  Future<void> registerQB(String email, String password) async {
    try {
      await QB.users.createUser(email, password, fullName: email);
    } on PlatformException catch (e) {
      // Some error occurred, look at the exception message for more details
      print(e);
    }
  }

  Future<List<QBUser?>> cekUserQB(String login) async {
    QBFilter qbFilter = new QBFilter();
    qbFilter.field = QBUsersFilterFields.FULL_NAME;
    qbFilter.operator = QBUsersFilterOperators.IN;
    qbFilter.type = QBUsersFilterTypes.STRING;
    List<QBUser?> userList = [];
    try {
      userList = await QB.users.getUsers();
    } on PlatformException catch (e) {
      print(e);
    }
    return userList.where((element) => element!.fullName == login).toList();
  }

  static QBController getInstance() {
    if (_instance == null) {
      _instance = QBController();
    }
    return _instance!;
  }

  set setSession(QBSession? session) {
    this._session = session;
  }

  QBSession? get qbSession => _session;

  set setUser(QBUser? qbUser) {
    this._qbUser = qbUser;
  }

  QBUser? get qbUser => _qbUser;
}
