import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color color;
  final VoidCallback? onTap;
  final double radius;
  final double height;
  final double padding;
  final int? isVerifyEmail;

  const CustomButton({
    super.key,
    required this.text,
    required this.textStyle,
    required this.color,
    required this.onTap,
    required this.radius,
    required this.height,
    required this.padding,
    this.isVerifyEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: GestureDetector(
        onTap: isVerifyEmail == 1 ? null : onTap,
        child: Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: isVerifyEmail == 1 ? MyColors.greyAccent : color,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
            child: Text(
              isVerifyEmail == 1 ? 'Đã xác thực' : text,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
