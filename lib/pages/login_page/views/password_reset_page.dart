import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_handle.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/textfield.dart';
import 'package:hutech_check_in_app/widgets/update_button.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {

  LoginHandle get loginHandle => Get.find<LoginHandle>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.blue,
        leading: const BackArrowButton(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [MyColors.blue, MyColors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MySizes.size25SW),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Đặt lại mật khẩu',
                  style: TextStyle(
                    color: MyColors.white,
                    fontFamily: 'SF-UI-BOLD',
                    fontSize: MySizes.size30SW,
                  ),
                ),
                SizedBox(height: MySizes.size10SW),
                Text(
                  "Vui lòng nhập đúng Email của bạn (đã đăng ký và xác thực trước đó). Một liên kết đặt lại mật khẩu sẽ được gửi đến bạn qua Email.",
                  style: MyTextStyles.content16RegularWhiteSW,
                ),
                SizedBox(height: MySizes.size20SW),
                CustomTextField(
                  numberKeyBoard: false,
                  padding: 0,
                  controller: loginHandle.resetPasswordController,
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.supervised_user_circle,
                    size: MySizes.size24SW,
                  ),
                  obscureText: false,
                ),
                SizedBox(height: MySizes.size20SW),
                UpdateButton(
                  color: MyColors.blueDart,
                  text: 'Gửi xác thực',
                  update: () async {
                    await loginHandle.handleResetPassword();
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
