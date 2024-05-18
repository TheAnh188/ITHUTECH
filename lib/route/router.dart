// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/announcements_home_page/announcements_home_page.dart';
import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_binding.dart';
import 'package:hutech_check_in_app/pages/announcements_page/views/announcements_page.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignment_series_binding.dart';
import 'package:hutech_check_in_app/pages/assignments_page/views/assignment_series_page.dart';
import 'package:hutech_check_in_app/pages/assignments_page/views/problems_page.dart';
import 'package:hutech_check_in_app/pages/check_in_page/views/check_in_page.dart';
import 'package:hutech_check_in_app/pages/assignments_page/views/detail_asssignment_page.dart';
import 'package:hutech_check_in_app/pages/check_in_page/views/check_in_detail_page.dart';
import 'package:hutech_check_in_app/pages/dashboard/dashboard_screen.dart';
import 'package:hutech_check_in_app/pages/groups_page/views/detail_group_page.dart';
import 'package:hutech_check_in_app/pages/dashboard/dashboard_binding.dart';
import 'package:hutech_check_in_app/pages/info_update_page/info_update_api/info_update_binding.dart';
import 'package:hutech_check_in_app/pages/info_update_page/views/email_update_page.dart';
import 'package:hutech_check_in_app/pages/feedback_page/feedback_page.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_binding.dart';
import 'package:hutech_check_in_app/pages/login_page/views/login_page.dart';
import 'package:hutech_check_in_app/pages/login_page/views/password_reset_page.dart';
import 'package:hutech_check_in_app/pages/members_page/api/members_binding.dart';
import 'package:hutech_check_in_app/pages/splash_screen/api/splash_binding.dart';
import 'package:hutech_check_in_app/pages/splash_screen/views/splash_screen.dart';
import 'package:hutech_check_in_app/pages/members_page/views/members_page.dart';
import 'package:hutech_check_in_app/pages/info_update_page/views/password_update_page.dart';
import 'package:hutech_check_in_app/pages/info_update_page/views/phone_number_update_page.dart';
import 'package:hutech_check_in_app/pages/qr_scanner_page/qr_binding.dart';
import 'package:hutech_check_in_app/pages/qr_scanner_page/qr_scanner_page.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_binding.dart';
import 'package:hutech_check_in_app/pages/standing_page/views/standings_page.dart';
import 'package:hutech_check_in_app/pages/info_update_page/views/info_update_page.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/group_introduction.dart';
import 'package:hutech_check_in_app/widgets/news_card.dart';
import 'package:hutech_check_in_app/widgets/upgrade.dart';
import 'package:upgrader/upgrader.dart';

class Routes {
  static const String INIT = '/splash';
  static const String DETAIL_GROUP = '/detail_group';
  static const String DETAIL_NEWS = '/news_detail';
  static const String GROUP_INTRO = '/group_introduction';
  static const String MAIN = '/main';
  static const String LOGIN = '/login';
  static const String RESET_PASSWORD = '/password_reset';
  static const String ANNOUN_HOME = '/announcement_home';
  static const String ASSIGNMENT = '/assignment';
  static const String DETAIL_ASSIGNMENT = '/detail_assignment';
  static const String CHECK_IN = '/check_in';
  static const String CHECK_IN_DETAIL = '/check_in_detail';
  static const String MEMBER = '/member';
  static const String RANKING = '/ranking';
  static const String FEEDBACK = '/feedback';
  static const String QR = '/qr';
  static const String INFO_UPDATE = '/info_update';
  static const String PHONE_NUMBER_UPDATE = '/phone_number_update';
  static const String EMAIL_UPDATE = '/email_update';
  static const String PASSWORD_UPDATE = '/password_update';
  static const String ASSIGNMENT_SERIES = '/assignment_series';
  static const String ANNOUNCEMENT = '/announcement';
}

class AppRoutes {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.INIT,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
      binding: SplashBinding(),
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.DETAIL_GROUP,
      page: () => const DetailGroupPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.DETAIL_NEWS,
      page: () => const NewsDetailPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.GROUP_INTRO,
      page: () => const GroupIntroduction(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => DashBoardScreen(key: dashBoardKey),
      transition: Transition.fadeIn,
      binding: DashboardBinding(),
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.LOGIN,
      binding: LoginBinding(),
      page: () => MyUpgradeAlert(
        upgrader: Upgrader(
          languageCode: "vi",
          durationUntilAlertAgain: const Duration(days: 1),
        ),
        child: const Login(),
      ),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const PasswordResetPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.ANNOUN_HOME,
      page: () => const AnnouncementsHomePage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.ANNOUNCEMENT,
      page: () => const AnnouncementsPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      binding: AnnouncementsBinding(),
    ),
    GetPage(
      name: Routes.DETAIL_ASSIGNMENT,
      page: () => const DetailAssignmentPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.ASSIGNMENT,
      page: () => const ProblemsPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.CHECK_IN,
      page: () => CheckInPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.CHECK_IN_DETAIL,
      page: () => CheckInDetailPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.MEMBER,
      page: () => const MembersPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      binding: MembersBinding(),
    ),
    GetPage(
      name: Routes.RANKING,
      page: () => const StandingPage(),
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 200),
      binding: StandingsBinding(),
    ),
    GetPage(
      name: Routes.FEEDBACK,
      page: () => const FeedbackPage(),
      transition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.QR,
      page: () => const QRScannerPage(),
      transition: Transition.fade,
      binding: QrBinding(),
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.INFO_UPDATE,
      page: () => InfoUpdatePage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      binding: InfoUpdateBinding(),
    ),
    GetPage(
      name: Routes.PHONE_NUMBER_UPDATE,
      page: () => const PhoneNumberUpdatePage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.EMAIL_UPDATE,
      page: () => const EmailUpdatePage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.PASSWORD_UPDATE,
      page: () => const PasswordUpdatePage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
    ),
    GetPage(
      name: Routes.ASSIGNMENT_SERIES,
      page: () => const AssignmentSeriesPage(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 200),
      binding: AssignmentSeriesBinding(),
    ),
    GetPage(
      name: '/no_route_match',
      page: () => Scaffold(
        body: Center(
          child: Text(
            'No routes match',
            style: TextStyle(
                fontSize: MySizes.size20SW, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 200),
    ),
  ];
}
