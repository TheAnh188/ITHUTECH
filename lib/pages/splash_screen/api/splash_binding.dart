import 'package:get/instance_manager.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/pages/splash_screen/api/splash_dio.dart';
import 'package:hutech_check_in_app/pages/splash_screen/api/splash_handle.dart';

class SplashBinding extends Bindings {
  SplashDio splashDio = Get.find();
  LocalStorageRepo localRepo = Get.find();

  @override
  void dependencies() {
    Get.put<SplashHandle>(
        SplashHandle(splashDio: splashDio, localRepo: localRepo));
  }
}
