//Simply, a Repository pattern is such pattern where the business will ask for receipt and won’t know how the price is getting calculated and printed on the receipt.
import 'package:hutech_check_in_app/core/local_storage.dart';

abstract class LocalStorageRepo {
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
  Future<bool> saveUuidDevice(String uuidDevice);
  Future<bool> saveUserId(String userId);
  Future<bool> saveAccessToken(String authToken);
  Future<bool> saveEmail(String email);
  Future<bool> saveNickName(String nickName);
  Future<bool> handleUnAuthorized();
  Future<bool> checkLogin();
}

class LocalStorageRepoImpl implements LocalStorageRepo {
  // local storage or remote api will be injected via constructor using DI
  // example:
  // Get.put(localStorage())
  // Get.put<AuthRepo>(AuthRepoImpl(localStorage: Get.find())
  LocalStorageRepoImpl({required this.localStorage});

  LocalStorage localStorage;

  @override
  bool? getIsTeacher() {
    return localStorage.getIsTeacher();
  }

  @override
  bool? getIsAdmin() {
    return localStorage.getIsAdmin();
  }

  @override
  String? getUserId() {
    return localStorage.getUserId();
  }

  @override
  String? getUuidDevice() {
    return localStorage.getUuidDevice();
  }

  @override
  String? getEmail() {
    return localStorage.getEmail();
  }

  @override
  String? getPassword() {
    return localStorage.getPassword();
  }

  @override
  String? getNickName() {
    return localStorage.getNickName();
  }

  @override
  Future<bool> saveIsTeacher(bool isTeacher) {
    return localStorage.saveIsTeacher(isTeacher);
  }

  @override
  Future<bool> savePassword(String password) {
    return localStorage.savePassword(password);
  }

  @override
  Future<bool> saveIsAdmin(bool isAdmin) {
    return localStorage.saveIsAdmin(isAdmin);
  }

  @override
  Future<bool> saveUserId(String userId) {
    return localStorage.saveUserId(userId);
  }

  @override
  Future<bool> saveUuidDevice(String uuidDevice) {
    return localStorage.saveUuidDevice(uuidDevice);
  }

  @override
  Future<bool> saveEmail(String email) async => localStorage.saveEmail(email);

  @override
  Future<bool> handleUnAuthorized() {
    return localStorage.handleUnAuthorized();
  }

  @override
  String? getAccessToken() {
    return localStorage.getAccessToken();
  }

  @override
  Future<bool> saveAccessToken(String authToken) async =>
      localStorage.saveAccessToken(authToken);

  @override
  Future<bool> saveNickName(String nickName) async =>
      localStorage.saveNickName(nickName);

  @override
  Future<bool> checkLogin() {
    return localStorage.checkLogin();
  }
}
