// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/info_update_page/info_update_api/info_update_handle.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_handle.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/button.dart';
import 'package:hutech_check_in_app/widgets/textfield.dart';
import 'package:provider/provider.dart';

class PasswordUpdatePage extends StatefulWidget {
  const PasswordUpdatePage({super.key});

  @override
  State<PasswordUpdatePage> createState() => _PasswordUpdatePageState();
}

class _PasswordUpdatePageState extends State<PasswordUpdatePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _infoUpdateHandle.passwordController.clear();
    _infoUpdateHandle.newPasswordController.clear();
    _infoUpdateHandle.retypedPasswordController.clear();
    super.dispose();
  }

  InfoUpdateHandle get _infoUpdateHandle => Get.find<InfoUpdateHandle>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Mật khẩu',
          style: MyTextStyles.content22BoldBlackSW,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: MySizes.size85SW,
        leadingWidth: MySizes.size65SW,
        leading: const BackArrowButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MySizes.size25SW, vertical: MySizes.size10SW),
            child: Column(
              children: [
                CustomTextField(
                  numberKeyBoard: false,
                  padding: 0,
                  controller: _infoUpdateHandle.passwordController,
                  hintText: 'Nhập mật khẩu hiện tại',
                  prefixIcon: Icon(
                    Icons.supervised_user_circle,
                    size: MySizes.size24SW,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: MySizes.size20SW),
                CustomTextField(
                  numberKeyBoard: false,
                  padding: 0,
                  controller: _infoUpdateHandle.newPasswordController,
                  hintText: 'Nhập mật khẩu mới',
                  prefixIcon: Icon(
                    Icons.supervised_user_circle,
                    size: MySizes.size24SW,
                  ),
                  suffixIcon: Tooltip(
                    textAlign: TextAlign.center,
                    textStyle: MyTextStyles.content15MediumWhiteSW,
                    showDuration: const Duration(milliseconds: 500),
                    preferBelow: false,
                    triggerMode: TooltipTriggerMode.tap,
                    message: 'Mật khẩu chứa ít nhất 8 kí tự',
                    child: Icon(
                      MyIcons.info,
                      color: MyColors.blue,
                      size: MySizes.size20SW,
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: MySizes.size20SW),
                CustomTextField(
                  numberKeyBoard: false,
                  padding: 0,
                  controller: _infoUpdateHandle.retypedPasswordController,
                  hintText: 'Xác nhận mật khẩu',
                  prefixIcon: Icon(
                    Icons.supervised_user_circle,
                    size: MySizes.size24SW,
                  ),
                  suffixIcon: Tooltip(
                    textAlign: TextAlign.center,
                    textStyle: MyTextStyles.content15MediumWhiteSW,
                    showDuration: const Duration(milliseconds: 500),
                    preferBelow: false,
                    triggerMode: TooltipTriggerMode.tap,
                    message: 'Mật khẩu chứa ít nhất 8 kí tự',
                    child: Icon(
                      MyIcons.info,
                      color: MyColors.blue,
                      size: MySizes.size20SW,
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: MySizes.size20SW),
                CustomButton(
                  padding: 0,
                  height: MySizes.size45SW,
                  text: 'Lưu thay đổi',
                  color: MyColors.blue,
                  radius: MySizes.size25SW,
                  textStyle: MyTextStyles.content20MediumWhiteSW,
                  onTap: () async {
                    await _infoUpdateHandle.handleChangePassword();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
