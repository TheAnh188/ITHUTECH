import 'package:get/instance_manager.dart';
import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_dio.dart';
import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_handle.dart';

class AnnouncementsBinding extends Bindings {
  AnnouncementsDio announcementsDio = Get.find();

  @override
  void dependencies() {
    Get.put<AnnouncementsHandle>(
        AnnouncementsHandle(announcementsDio: announcementsDio));
  }
}
