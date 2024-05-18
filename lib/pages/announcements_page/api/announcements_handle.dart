import 'package:get/get.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_dio.dart';
import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_response.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class AnnouncementsHandle extends GetxController {
  AnnouncementsDio announcementsDio;
  AnnouncementsHandle({required this.announcementsDio});

  final announcements = <Announcement>[].obs;

  Future<bool> handleGetAnnouncements(int entityId) async {
    var response = await announcementsDio.getAnnouncements(entityId);
    announcements.clear();
    if (response.statusCode == 200) {
      if (response.data != null) {
        announcements.addAll(response.data!.announcement!);
      }
      return true;
    } else {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: response.message!,
      );
      return false;
    }
  }
}
