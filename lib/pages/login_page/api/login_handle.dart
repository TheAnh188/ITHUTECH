import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_dio.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class LoginHandle extends GetxController {
  AuthApi authApi;
  LocalStorageRepo localRepo;

  LoginHandle({required this.authApi, required this.localRepo});

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController resetPasswordController = TextEditingController();

  //Xử lý đăng nhập
  Future<void> handleLogin() async {
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());

    if (userController.text.isEmpty || passwordController.text.isEmpty) {
      SnackbarCustom.showError(
        message: "Cần nhập đầy đủ thông tin đăng nhập",
        context: navigatorKey.currentContext!,
      );
    } else {
      await loading(status: 'Đang đăng nhập');

      var response =
          await authApi.login(userController.text, passwordController.text);

      //Đăng nhập thất bại
      if (response.statusCode != 200) {
        await dissmis();
        SnackbarCustom.showError(
          message: response.message!,
          context: navigatorKey.currentContext!,
        );
      }
      //Trường hợp đăng nhập thành công
      else {
        await localRepo.saveAccessToken(response.data!.token!.accessToken!);
        await localRepo.saveEmail(response.data!.userInfo!.email!);
        await localRepo.saveUserId(response.data!.userInfo!.id!.toString());
        await localRepo.saveNickName(response.data!.userInfo!.nickname!);
        await localRepo.saveIsTeacher(response.data!.userInfo!.isTeacher!);
        await localRepo.saveIsAdmin(response.data!.userInfo!.isAdmin!);
        await localRepo.savePassword(passwordController.text);
        Get.offAllNamed(Routes.MAIN);
        SnackbarCustom.showSuccess(
          message: response.message!,
          context: navigatorKey.currentContext!,
        );
        await dissmis();
      }
    }
  }

  //Chức năng đăng xuất
  Future<void> handleLogout() async {
    localRepo.handleUnAuthorized();

    Get.offAllNamed(Routes.LOGIN);

    SnackbarCustom.showSuccess(
      message: "Đã đăng xuất",
      context: navigatorKey.currentContext!,
    );
  }

  //Chức năng khôi phục mật khẩu
  Future<void> handleResetPassword() async {
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());
    if (resetPasswordController.text.isEmpty) {
      SnackbarCustom.showError(
        message: "Thông tin không được bỏ trống",
        context: navigatorKey.currentContext!,
      );
    } else if (!resetPasswordController.text.isEmail) {
      SnackbarCustom.showError(
        message: "Không đúng định dạng email",
        context: navigatorKey.currentContext!,
      );
    } else {
      await loading();
      var response = await authApi.resetPassword(resetPasswordController.text);
      await dissmis();
      if (response.statusCode == 200) {
        resetPasswordController.clear();
        SnackbarCustom.showSuccess(
          message: response.message!,
          context: navigatorKey.currentContext!,
        );
      } else {
        SnackbarCustom.showError(
          message: response.message!,
          context: navigatorKey.currentContext!,
        );
      }
    }
  }
}
