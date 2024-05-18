import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String hintText;
  final double padding;
  final bool numberKeyBoard;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.prefixIcon,
      this.suffixIcon,
      required this.obscureText,
      required this.hintText,
      required this.padding,
      required this.numberKeyBoard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(MySizes.size25SW),
          boxShadow: [
            BoxShadow(
              color: MyColors.lightBlue,
              blurRadius: MySizes.size1SW,
              spreadRadius: MySizes.size1SW,
            )
          ],
        ),
        child: TextFormField(
          textAlign: TextAlign.justify,
          obscureText: obscureText,
          controller: controller,
          inputFormatters: numberKeyBoard
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : null,
          keyboardType: numberKeyBoard ? TextInputType.number : null,
          style: MyTextStyles.content17MediumBlackSW,
          cursorWidth: MySizes.size2SW,
          decoration: InputDecoration(
            prefixIconConstraints: BoxConstraints.expand(
              width: MySizes.size50SW,
              height: MySizes.size50SW,
            ),
            suffixIconConstraints: BoxConstraints.expand(
              width: MySizes.size50SW,
              height: MySizes.size50SW,
            ),
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
