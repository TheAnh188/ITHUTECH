import 'package:get/get.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/splash_screen/api/splash_dio.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';
import 'dart:async';

class SplashHandle extends GetxController {
  SplashDio splashDio;
  LocalStorageRepo localRepo;

  SplashHandle({required this.splashDio, required this.localRepo});

  @override
  void onInit() async {
    super.onInit();
    await handleGetNickName();
  }

  Future<void> handleGetNickName() async {
    var response = await splashDio.getNickName();
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.MAIN);
    } else {
      SnackbarCustom.showError(
        message: response.message,
        context: navigatorKey.currentContext!,
      );
    }
  }
}
