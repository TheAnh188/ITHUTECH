import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/account_page/api/account_handle.dart';
import 'package:hutech_check_in_app/pages/info_update_page/info_update_api/info_update_handle.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/button.dart';
import 'package:hutech_check_in_app/widgets/textfield.dart';

class EmailUpdatePage extends StatefulWidget {
  const EmailUpdatePage({super.key});

  @override
  State<EmailUpdatePage> createState() => _EmailUpdatePageState();
}

class _EmailUpdatePageState extends State<EmailUpdatePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _infoUpdateHandle.emailController.clear();
    super.dispose();
  }

  InfoUpdateHandle get _infoUpdateHandle => Get.find<InfoUpdateHandle>();
  AccountHandle get _accountHandle => Get.find<AccountHandle>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Email',
          style: MyTextStyles.content22BoldBlackSW,
        ),
        toolbarHeight: MySizes.size85SW,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  controller: _infoUpdateHandle.emailController,
                  hintText: 'Nhập email mới',
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
                    message: 'Nhập đúng định dạng email',
                    child: Icon(
                      MyIcons.info,
                      color: MyColors.blue,
                      size: MySizes.size20SW,
                    ),
                  ),
                  obscureText: false,
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
                    await _infoUpdateHandle.handleChangeEmail();
                  },
                ),
                SizedBox(height: MySizes.size15SW),
                CustomButton(
                  isVerifyEmail:
                      _accountHandle.accountResponse.value.isVerifyEmail,
                  padding: 0,
                  height: MySizes.size45SW,
                  text: 'Gửi xác thực',
                  color: MyColors.red,
                  radius: MySizes.size25SW,
                  textStyle: MyTextStyles.content20MediumWhiteSW,
                  onTap: () async {
                    await _infoUpdateHandle.handleVerifyEmail();
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
