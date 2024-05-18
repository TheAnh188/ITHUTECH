import 'package:get/instance_manager.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/pages/account_page/api/account_dio.dart';
import 'package:hutech_check_in_app/pages/account_page/api/account_handle.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_dio.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_handle.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_dio.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_handle.dart';
import 'package:hutech_check_in_app/pages/home_page/api/home_dio.dart';
import 'package:hutech_check_in_app/pages/home_page/api/home_handle.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_dio.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_handle.dart';

class DashboardBinding extends Bindings {
  HomeDio homeDio = Get.find();
  CheckInDio checkInDio = Get.find();
  LocalStorageRepo localRepo = Get.find();
  GroupsDio groupsDio = Get.find();
  AccountDio accountDio = Get.find();
  AuthApi authApi = Get.find();

  @override
  void dependencies() {
    Get.put<HomeHandle>(HomeHandle(homeDio: homeDio));
    Get.put<CheckInHandle>(
        CheckInHandle(checkInDio: checkInDio, localRepo: localRepo));
    Get.put<GroupsHandle>(GroupsHandle(groupsDio: groupsDio));
    Get.put<AccountHandle>(AccountHandle(accountDio: accountDio));
    Get.put<LoginHandle>(LoginHandle(authApi: authApi, localRepo: localRepo));
  }
}
