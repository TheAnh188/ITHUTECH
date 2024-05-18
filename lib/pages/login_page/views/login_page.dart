import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_handle.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/button.dart';
import 'package:hutech_check_in_app/widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> with TickerProviderStateMixin {
  late bool _hidePassword;
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = true;
    _hidePassword = true;
  }

  void toggle() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  LoginHandle get loginHandle => Get.find<LoginHandle>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: MyColors.blue,
        body: SafeArea(
          bottom: false,
          child: _buildLoginScreen(),
        ));
  }

  Widget _buildLoginScreen() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [MyColors.blue, MyColors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              _buildLogoAndTitle(),
              _buildLoginForm(),
            ],
          ),
          _buildTermsAndConditions(),
        ],
      ),
    );
  }

  Widget _buildLogoAndTitle() {
    bool keyBoardOpened = MediaQuery.of(context).viewInsets.bottom != 0;
    return Column(
      children: [
        Image.asset(
          Images.logo,
          width: !keyBoardOpened ? MySizes.size110SW : MySizes.size80SW,
        ),
        SizedBox(height: keyBoardOpened ? MySizes.size20SW : 0),
        !keyBoardOpened
            ? Container(
                alignment: Alignment.center,
                child: Text(
                  "Hệ thống hỗ trợ học tập cho Sinh viên\n Khoa Công nghệ thông tin HUTECH",
                  textAlign: TextAlign.center,
                  style: MyTextStyles.content16BoldWhiteSW,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        SizedBox(height: MySizes.size20SW),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              numberKeyBoard: false,
              padding: MySizes.size40SW,
              controller: loginHandle.userController,
              hintText: "Mã số sinh viên hoặc Email",
              prefixIcon: Icon(
                Icons.supervised_user_circle,
                size: MySizes.size24SW,
              ),
              obscureText: false,
            ),
            SizedBox(height: MySizes.size20SW),
            CustomTextField(
              numberKeyBoard: false,
              padding: MySizes.size40SW,
              controller: loginHandle.passwordController,
              prefixIcon: Icon(
                Icons.security_outlined,
                size: MySizes.size24SW,
              ),
              obscureText: _hidePassword,
              suffixIcon: GestureDetector(
                onTap: toggle,
                child: Icon(
                  _hidePassword ? Icons.visibility_off : Icons.visibility,
                  size: MySizes.size24SW,
                ),
              ),
              hintText: "Mật khẩu",
            ),
          ],
        ),
        SizedBox(height: MySizes.size20SW),
        CustomButton(
          padding: MySizes.size110SW,
          height: MySizes.size45SW,
          text: 'Đăng nhập',
          color: MyColors.blueDart,
          radius: MySizes.size20SW,
          textStyle: MyTextStyles.content18BoldWhiteSW,
          onTap: () {
            loginHandle.handleLogin();
          },
        ),
        SizedBox(height: MySizes.size10SW),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/password_reset');
          },
          child: Text(
            "Quên mật khẩu?",
            style: MyTextStyles.content16RegularBlueSW,
          ),
        ),
      ],
    );
  }

  Widget _buildTermsAndConditions() {
    return Padding(
      padding: EdgeInsets.only(
        right: MySizes.size20SW,
        left: MySizes.size20SW,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MySizes.size15SW),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(123, 174, 255, 0.5),
              blurRadius: MySizes.size2SW,
              spreadRadius: MySizes.size2SW,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Tôi đồng ý với ',
                    style: MyTextStyles.content16RegularBlackSW,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Điều khoản sử dụng ',
                        style: MyTextStyles.content16RegularBlueSW,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                              constraints: BoxConstraints.expand(
                                width: 1.sw,
                                height: 0.5.sh + MySizes.size25SW,
                              ),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MySizes.size20SW),
                                topRight: Radius.circular(MySizes.size20SW),
                              )),
                              context: context,
                              builder: (context) {
                                return _buildDetailTermsOfUse();
                              },
                            );
                          },
                      ),
                    ],
                  ),
                ),
                Text(
                  'của IT HUTECH',
                  style: MyTextStyles.content16RegularBlackSW,
                )
              ],
            ),
            SizedBox(
              height: MySizes.size20SW,
              width: MySizes.size30SW,
              child: Transform.scale(
                scale: MySizes.size1SW,
                child: Checkbox(
                  splashRadius: 0,
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  activeColor: MyColors.blue,
                  checkColor: MyColors.white,
                  side: const BorderSide(
                    color: MyColors.grey,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTermsOfUse() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: MySizes.size20SW, vertical: MySizes.size20SW),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('CHÍNH SÁCH VÀ ĐIỀU KHOẢN',
                style: MyTextStyles.content20MediumBlueSW),
          ),
          SizedBox(height: MySizes.size10SW),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextBold('Chúng tôi thu thập những thông tin gì?'),
              _buildTextMedium(
                '- Chúng tôi thu thập thông tin từ bạn khi bạn điền vào một biểu mẫu.',
              ),
              _buildTextMedium(
                '- Chúng tôi có thể thu thập các thông tin như tên thiết bị, hệ điều hành, kích cỡ màn hình ngôn ngữ và vị trí.',
              ),
              SizedBox(height: MySizes.size5SW),
              _buildTextBold('Chúng tôi sử dụng thông tin của bạn để làm gì?'),
              _buildTextMedium(
                '- Để cá nhân hoá trải nghiệm của bạn: Thông tin của bạn sẽ giúp chúng tôi đáp ứng nhu cầu cá nhân của bạn.',
              ),
              _buildTextMedium(
                '- Để cải thiện ứng dụng: Thông tin của bạn sẽ giúp chúng tôi đáp ứng tốt hơn các yêu cầu dịch vụ và nhu cầu hỗ trợ',
              ),
              SizedBox(height: MySizes.size5SW),
              _buildTextBold('Chính sách bảo mật trực tuyến'),
              _buildTextMedium(
                'Chính sách bảo mật trực tuyến này chỉ áp dụng cho các thông tin thu thập được thông qua trang web, ứng dụng của chúng tôi và không để thu thập thông tin ẩn.',
              ),
              SizedBox(height: MySizes.size5SW),
              _buildTextBold('Sự đồng ý của bạn'),
              _buildTextMedium(
                'Bằng cách sử dụng ứng dụng, bạn bằng lòng với chính sách riêng tư của chúng tôi.',
              ),
              _buildTextBold('Thay đổi chính sách bảo mật của chúng tôi'),
              _buildTextMedium(
                'Nếu có bất kỳ câu hỏi liên quan đến chính sách bảo mật này, bạn có thể liên hệ với chúng tôi',
              ),
            ],
          ),
          SizedBox(height: MySizes.size15SW),
          Center(
            child: CustomButton(
              padding: 0,
              height: MySizes.size45SW,
              onTap: () {
                setState(() {
                  _isChecked = true;
                });
                Navigator.pop(context);
              },
              color: MyColors.blue,
              textStyle: MyTextStyles.content18MediumWhiteSW,
              text: 'Đồng ý',
              radius: MySizes.size20SW,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextBold(String content) {
    return Text(
      content,
      style: MyTextStyles.content16BoldBlackSW,
    );
  }

  Widget _buildTextMedium(String content) {
    return Padding(
      padding: EdgeInsets.only(left: MySizes.size10SW),
      child: Text(
        content,
        style: MyTextStyles.content14MediumBlackSW,
      ),
    );
  }
}
