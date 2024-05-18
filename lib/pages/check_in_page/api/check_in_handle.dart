import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_dio.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_response.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_result_response.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';
import 'dart:async';
import 'package:uuid/uuid.dart';

class CheckInHandle extends GetxController {
  CheckInDio checkInDio;
  LocalStorageRepo localRepo;

  CheckInHandle({required this.checkInDio, required this.localRepo});

  late Map<String, dynamic> deviceInfo = {};
  final checkIns = <CheckIn>[].obs;
  final checkInResults = <CheckInResult>[].obs;

  Future<void> getDeviceInfo() async {
    if (localRepo.getUuidDevice() == null) {
      var uuidDevice = const Uuid().v1();
      deviceInfo = <String, dynamic>{
        'id': '${localRepo.getUserId()}_$uuidDevice',
        'name': Platform.isIOS ? 'iOS' : 'Android',
      };
    } else {
      deviceInfo = <String, dynamic>{
        'id': localRepo.getUuidDevice(),
        'name': Platform.isIOS ? 'iOS' : 'Android',
      };
    }
  }

  Future<void> handleCheckDevice() async {
    await getDeviceInfo();
    await loading();
    var response = await checkInDio.checkDevice(deviceInfo['id']);
    await dissmis();
    if (response.statusCode == 400) {
      showDialog(
        builder: (context) => AlertDialog(
          backgroundColor: MyColors.white, // Thiết lập màu nền là trắng
          iconPadding: const EdgeInsets.all(0),
          insetPadding: EdgeInsets.symmetric(
            horizontal: MySizes.size40SW,
            vertical: MySizes.size24SW,
          ),
          titlePadding: EdgeInsets.only(
              top: MySizes.size24SW,
              left: MySizes.size24SW,
              right: MySizes.size24SW),
          contentPadding: EdgeInsets.all(MySizes.size24SW),
          actionsPadding: EdgeInsets.only(
            bottom: MySizes.size25SW,
            right: MySizes.size25SW,
          ),
          buttonPadding: EdgeInsets.symmetric(
            horizontal: MySizes.size8SW,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              MySizes.size10SW,
            ),
          ),
          actionsOverflowButtonSpacing: 0,
          title: Text(
            'Kích hoạt điểm danh',
            style: MyTextStyles.content25MediumBlackSW,
          ),
          content: Text(
            response.message ?? '',
            style: MyTextStyles.content16RegularBlackSW,
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                navigatorKey.currentState!.pop();
                var response = await checkInDio.activateUserId(
                    deviceInfo['id'], deviceInfo['name']);
                if (response.statusCode == 200) {
                  await localRepo.saveUuidDevice(deviceInfo['id']);
                  SnackbarCustom.showSuccess(
                    context: navigatorKey.currentContext!,
                    message: response.message!,
                  );
                } else {
                  SnackbarCustom.showError(
                    context: navigatorKey.currentContext!,
                    message: response.message!,
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.all(MySizes.size10SW),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MySizes.size10SW),
                  color: MyColors.blue,
                ),
                child: Text(
                  'Kích hoạt',
                  style: MyTextStyles.content16MediumWhiteSW,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MySizes.size20SW,
                  vertical: MySizes.size10SW,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MySizes.size10SW),
                  color: MyColors.grey,
                ),
                child: Text(
                  'Hủy',
                  style: MyTextStyles.content16MediumWhiteSW,
                ),
              ),
            ),
          ],
        ),
        context: navigatorKey.currentContext!,
      );
    } else if (response.statusCode == 402) {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        title: 'Lỗi vượt quá giới hạn',
        message: response.message,
      );
    } else if (response.statusCode == 403) {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        title: 'Trùng thiết bị điểm danh',
        message: response.message,
      );
    } else if (response.statusCode == 200) {
      Get.toNamed(Routes.QR);
    } else {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: response.message,
      );
    }
  }

  Future<void> handleCheckInByQR(String encryptedContent) async {
    await getDeviceInfo();
    var response =
        await checkInDio.checkInByQR(encryptedContent, deviceInfo['id']);
    if (response.statusCode == 200) {
      SnackbarCustom.showSuccess(
        context: navigatorKey.currentContext!,
        message: response.message,
      );
    } else {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: response.message,
      );
    }
  }

  Future<bool> handleGetCheckIn(int groupId) async {
    var response = await checkInDio.getCheckIn(groupId);
    checkIns.clear();
    if (response.statusCode == 200) {
      if (response.data != null) {
        checkIns.addAll(response.data!.checkIn!);
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

  Future<bool> handleGetCheckInResults(int checkInID) async {
    var response = await checkInDio.getCheckInResult(checkInID);
    checkInResults.clear();
    if (response.statusCode == 200) {
      if (response.data != null) {
        checkInResults.addAll(response.data!.checkInResult!);
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
