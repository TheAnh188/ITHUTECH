import 'package:get/instance_manager.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_dio.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_handle.dart';

class QrBinding extends Bindings {
  CheckInDio checkInDio = Get.find();
  LocalStorageRepo localRepo = Get.find();

  @override
  void dependencies() {
    Get.put<CheckInHandle>(
        CheckInHandle(checkInDio: checkInDio, localRepo: localRepo));
  }
}
