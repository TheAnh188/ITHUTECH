import 'package:get/instance_manager.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_dio.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_handle.dart';

class LoginBinding extends Bindings {
  AuthApi authApi = Get.find();
  LocalStorageRepo localRepo = Get.find();

  @override
  void dependencies() {
    Get.put<LoginHandle>(LoginHandle(authApi: authApi, localRepo: localRepo));
  }
}
