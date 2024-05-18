import 'package:flutter/material.dart';
import 'package:flutter_regex/flutter_regex.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/info_update_page/info_update_api/info_update_dio.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class InfoUpdateHandle extends GetxController {
  InfoUpdateDio infoUpdateDio;
  LocalStorageRepo localRepo;

  InfoUpdateHandle({required this.infoUpdateDio, required this.localRepo});

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController retypedPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> handleChangePassword() async {
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());
    if (passwordController.text.isEmpty ||
        newPasswordController.text.isEmpty ||
        retypedPasswordController.text.isEmpty) {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: 'Thông tin không được bỏ trống',
      );
    } else if (passwordController.text != localRepo.getPassword()) {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: 'Mật khẩu hiện tại không chính xác',
      );
    } else if (newPasswordController.text != retypedPasswordController.text) {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: 'Mật khẩu xác nhận không khớp',
      );
    } else if (newPasswordController.text == passwordController.text) {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: 'Mật khẩu mới đang được sử dụng',
      );
    } else if (!newPasswordController.text.isPasswordEasy()) {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: 'Mật khẩu mới chứa ít nhất 8 kí tự',
      );
    } else {
      await loading(status: 'Đang cập nhật');
      var response =
          await infoUpdateDio.changePassword(newPasswordController.text);
      await dissmis();
      if (response.statusCode == 200) {
        localRepo.savePassword(newPasswordController.text);
        passwordController.clear();
        newPasswordController.clear();
        retypedPasswordController.clear();
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
    }
  }

  Future<void> handleChangeEmail() async {
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());
    if (emailController.text.isEmpty) {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: 'Thông tin không được bỏ trống',
      );
    } else if (!emailController.text.isEmail()) {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: 'Không đúng định dạng email',
      );
    } else if (emailController.text == localRepo.getEmail()) {
      emailController.clear();
      SnackbarCustom.showError(
        message: 'Email đã được sử dụng',
        context: navigatorKey.currentContext!,
      );
    } else {
      await loading(status: 'Đang cập nhật');
      var response = await infoUpdateDio.changeEmail(emailController.text);
      await dissmis();
      if (response.statusCode == 200) {
        localRepo.saveEmail(emailController.text);
        emailController.clear();
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

  Future<void> handleVerifyEmail() async {
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());
    await loading();
    var response = await infoUpdateDio.verifyEmail();
    await dissmis();
    if (response.statusCode == 200) {
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

  Future<void> handleChangePhoneNumber() async {
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());
    if (phoneNumberController.text.isEmpty) {
      SnackbarCustom.showError(
        message: 'Thông tin không được bỏ trống',
        context: navigatorKey.currentContext!,
      );
    } else if (!phoneNumberController.text.isPhone()) {
      SnackbarCustom.showError(
        message: 'Không đúng định dạng sđt',
        context: navigatorKey.currentContext!,
      );
    } else {
      await loading(status: 'Đang cập nhật');
      var response =
          await infoUpdateDio.changePhoneNumber(phoneNumberController.text);
      await dissmis();
      if (response.statusCode == 200) {
        phoneNumberController.clear();
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
