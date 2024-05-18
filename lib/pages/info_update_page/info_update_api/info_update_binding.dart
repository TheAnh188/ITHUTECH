import 'package:get/instance_manager.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/pages/info_update_page/info_update_api/info_update_dio.dart';
import 'package:hutech_check_in_app/pages/info_update_page/info_update_api/info_update_handle.dart';

class InfoUpdateBinding extends Bindings {
  InfoUpdateDio infoUpdateDio = Get.find();
  LocalStorageRepo localRepo = Get.find();

  @override
  void dependencies() {
    Get.put<InfoUpdateHandle>(
        InfoUpdateHandle(infoUpdateDio: infoUpdateDio, localRepo: localRepo));
  }
}
