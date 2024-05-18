import 'package:get/instance_manager.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_dio.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_handle.dart';

class StandingsBinding extends Bindings {
  StandingsDio standingsDio = Get.find();

  @override
  void dependencies() {
    Get.put<StandingHandle>(StandingHandle(standingsDio: standingsDio));
  }
}
