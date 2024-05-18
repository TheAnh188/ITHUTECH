// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/core/local_storage.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/pages/account_page/api/account_dio.dart';
import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_dio.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignments_dio.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_dio.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_dio.dart';
import 'package:hutech_check_in_app/pages/home_page/api/home_dio.dart';
import 'package:hutech_check_in_app/pages/info_update_page/info_update_api/info_update_dio.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_dio.dart';
import 'package:hutech_check_in_app/pages/members_page/api/members_dio.dart';
import 'package:hutech_check_in_app/pages/splash_screen/api/splash_dio.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices {
  static Future<void> initServices() async {
    print('Starting services ...');

    await Get.putAsync<SharedPreferences>(() async {
      return await SharedPreferences.getInstance();
    });

    Get.put<LocalStorage>(LocalStorageImpl(sharedPref: Get.find()));
    Get.put<LocalStorageRepo>(LocalStorageRepoImpl(localStorage: Get.find()));
    Get.put<DioApi>(DioApi(localRepo: Get.find()));
    Get.put<AuthApi>(AuthApiIpml(dioApi: Get.find()));
    Get.put<HomeDio>(HomeDioImpl(dioApi: Get.find()));
    Get.put<CheckInDio>(CheckInDioIpml(dioApi: Get.find()));
    Get.put<GroupsDio>(GroupsDioIpml(dioApi: Get.find()));
    Get.put<SplashDio>(SplashDioIpml(dioApi: Get.find()));
    Get.put<AssignmentsDio>(AssignmentsDioIpml(dioApi: Get.find()));
    Get.put<StandingsDio>(StandingsDioIpml(dioApi: Get.find()));
    Get.put<AnnouncementsDio>(AnnouncementsDioIpml(dioApi: Get.find()));
    Get.put<MembersDio>(MembersDioIpml(dioApi: Get.find()));
    Get.put<AccountDio>(AccountDioIpml(dioApi: Get.find()));
    Get.put<InfoUpdateDio>(InfoUpdateDioIpml(dioApi: Get.find()));

    print('All services started! ✅');
  }
}
