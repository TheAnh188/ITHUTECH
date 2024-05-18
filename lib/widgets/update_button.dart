import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class UpdateButton extends StatefulWidget {
  final Function() update;
  final String? text;
  final Color? color;
  final int? isVerifyEmail;
  const UpdateButton({
    super.key,
    required this.update,
    this.text,
    this.color,
    this.isVerifyEmail,
  });

  @override
  State<UpdateButton> createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<UpdateButton> {
  void onTap() {
    widget.update();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isVerifyEmail == 1 ? null : onTap,
      child: Container(
        height: MySizes.size45SW,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.isVerifyEmail == 1
              ? MyColors.greyAccent
              : widget.color ?? MyColors.blue,
          borderRadius: BorderRadius.circular(MySizes.size25SW),
        ),
        child: Center(
          child: Text(
            widget.isVerifyEmail == 1
                ? 'Đã xác thực'
                : widget.text ?? 'Lưu thay đổi',
            style: MyTextStyles.content20MediumWhiteSW,
          ),
        ),
      ),
    );
  }
}
