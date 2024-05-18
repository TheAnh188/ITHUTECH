import 'package:hutech_check_in_app/pages/login_page/api/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  String? getAccessToken();

  String? getUserId();

  String? getEmail();

  String? getNickName();

  String? getUuidDevice();

  String? getPassword();

  bool? getIsTeacher();

  bool? getIsAdmin();

  Future<bool> saveIsTeacher(bool isTeacher);

  Future<bool> savePassword(String password);

  Future<bool> saveIsAdmin(bool isAdmin);

  Future<bool> saveAuthToken(Token apiKey);

  Future<bool> saveAccessToken(String accessToken);

  Future<bool> saveNickName(String nickName);

  Future<bool> saveUserId(String userId);

  Future<bool> saveEmail(String email);

  Future<bool> saveUuidDevice(String uuidDevice);

  Future<bool> handleUnAuthorized();

  Future<bool> checkLogin();
}

class LocalStorageImpl implements LocalStorage {
  SharedPreferences sharedPref;

  LocalStorageImpl({required this.sharedPref});

  @override
  bool? getIsTeacher() {
    return sharedPref.getBool('isTeacher');
  }

  @override
  bool? getIsAdmin() {
    return sharedPref.getBool('isAdmin');
  }

  @override
  String? getAccessToken() {
    return sharedPref.getString('accessToken');
  }

  @override
  String? getPassword() {
    return sharedPref.getString('password');
  }

  @override
  String? getUserId() {
    return sharedPref.getString('userId');
  }

  @override
  String? getEmail() {
    return sharedPref.getString('email');
  }

  @override
  String? getNickName() {
    return sharedPref.getString('nickname');
  }

  @override
  String? getUuidDevice() {
    return sharedPref.getString('uuid_device');
  }

  @override
  Future<bool> saveUuidDevice(String uuidDevice) async {
    await sharedPref.setString('uuid_device', uuidDevice);
    return true;
  }

  @override
  Future<bool> savePassword(String password) async {
    await sharedPref.setString('password', password);
    return true;
  }

  @override
  Future<bool> saveAuthToken(Token apiKey) async {
    await sharedPref.setString('accessToken', apiKey.accessToken!);
    await sharedPref.setString('refreshToken', apiKey.refreshToken!);
    return true;
  }

  @override
  Future<bool> saveUserId(String userId) async {
    await sharedPref.setString('userId', userId);
    return true;
  }

  @override
  Future<bool> saveEmail(String email) async {
    await sharedPref.setString('email', email);
    return true;
  }

  @override
  Future<bool> saveIsTeacher(bool isTeacher) async {
    await sharedPref.setBool('isTeacher', isTeacher);
    return true;
  }

  @override
  Future<bool> saveIsAdmin(bool isAdmin) async {
    await sharedPref.setBool('isAdmin', isAdmin);
    return true;
  }

  @override
  Future<bool> handleUnAuthorized() async {
    String? uuidDevice = sharedPref.getString('uuid_device');
    await sharedPref.clear();
    if (uuidDevice != null) {
      await sharedPref.setString('uuid_device', uuidDevice);
    }
    return true;
  }

  @override
  Future<bool> saveAccessToken(String accessToken) async {
    await sharedPref.setString('accessToken', accessToken);
    return true;
  }

  @override
  Future<bool> saveNickName(String nickName) async {
    await sharedPref.setString('nickname', nickName);
    return true;
  }

  @override
  Future<bool> checkLogin() async {
    var check = sharedPref.getString('accessToken');
    if (check != null) {
      return true;
    }
    return false;
  }
}
