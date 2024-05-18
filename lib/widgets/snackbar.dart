import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class SnackbarCustom {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    required Widget icon,
    required Color backgroundColor,
    required Color colorText,
    Duration duration = const Duration(seconds: 2),
  }) {
    final snackBar = SnackBar(
      // onVisible: onVisible,
      behavior: SnackBarBehavior.fixed,
      padding: EdgeInsets.symmetric(
        horizontal: MySizes.size15SW,
        vertical: MySizes.size10SW,
      ),
      content: Row(
        children: [
          icon,
          SizedBox(width: MySizes.size10SW),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: MyTextStyles.content15BoldWhiteSW,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                message,
                style: MyTextStyles.content15MediumWhiteSW,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      duration: duration,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showError({
    required BuildContext context,
    String? title,
    String? message,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      context: context,
      title: title ?? 'Lỗi',
      message: message ?? 'Không thành công',
      icon: Icon(
        Icons.error,
        color: Colors.white,
        size: MySizes.size24SW,
      ),
      backgroundColor: MyColors.red,
      colorText: MyColors.white,
      duration: duration,
    );
  }

  static void showInfo({
    required BuildContext context,
    String? title,
    String? message,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      context: context,
      title: title ?? 'Thông tin',
      message: message ?? 'Thông tin',
      icon: Icon(
        Icons.info,
        color: Colors.white,
        size: MySizes.size24SW,
      ),
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      duration: duration,
    );
  }

  static void showSuccess({
    required BuildContext context,
    String? title,
    String? message,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      context: context,
      title: title ?? 'Thành công',
      message: message ?? 'Thành công',
      icon: Icon(
        Icons.check,
        color: Colors.white,
        size: MySizes.size24SW,
      ),
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: duration,
    );
  }

  static void showWarning({
    required BuildContext context,
    String? title,
    String? message,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      context: context,
      title: title ?? 'Cảnh báo',
      message: message ?? 'Cảnh báo',
      icon: Icon(
        Icons.warning,
        color: Colors.white,
        size: MySizes.size24SW,
      ),
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      duration: duration,
    );
  }
}
