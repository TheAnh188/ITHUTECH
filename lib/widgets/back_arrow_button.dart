// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class BackArrowButton extends StatefulWidget {
  final Color? color;
  final Function()? function;
  const BackArrowButton({super.key, this.color, this.function});

  @override
  State<BackArrowButton> createState() => _BackArrowButtonState();
}

class _BackArrowButtonState extends State<BackArrowButton> {
  void _onPressed() async {
    if (widget.function != null) {
      widget.function!();
    }
    Get.back();
    if (ModalRoute.of(context)?.settings.name == Routes.RANKING ||
        ModalRoute.of(context)?.settings.name == Routes.FEEDBACK) {
      Navigator.maybePop(context);
      print(ModalRoute.of(context)?.settings.name);
    }
    await dissmis();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Icon(
        MyIcons.backArrow,
        size: MySizes.size24SW,
        color: widget.color,
      ),
    );
  }
}
