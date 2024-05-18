import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class InforUpdateCard extends StatelessWidget {
  final String title;
  final String detail;
  final bool enable;
  final String route;
  final int? isVerifyEmail;
  final Function()? function;
  const InforUpdateCard({
    super.key,
    required this.title,
    required this.detail,
    required this.enable,
    required this.route,
    this.isVerifyEmail,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enable
          ? () {
              if (function != null) {
                function!();
              }
              Get.toNamed(route);
            }
          : null,
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: MySizes.size20SW, vertical: MySizes.size12SW),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: MyColors.black,
                            fontFamily: 'Roboto-Medium',
                            fontSize: MySizes.size16SW,
                            wordSpacing: -2,
                          ),
                        ),
                        SizedBox(width: MySizes.size5SW),
                        isVerifyEmail != null
                            ? isVerifyEmail == 0
                                ? Tooltip(
                                    decoration: BoxDecoration(
                                      color: MyColors.red,
                                      borderRadius: BorderRadius.circular(
                                        MySizes.size5SW,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    textStyle:
                                        MyTextStyles.content15MediumWhiteSW,
                                    showDuration:
                                        const Duration(milliseconds: 500),
                                    preferBelow: false,
                                    triggerMode: TooltipTriggerMode.tap,
                                    message: 'Chưa xác thực',
                                    child: Icon(
                                      MyIcons.info,
                                      color: MyColors.red,
                                      size: MySizes.size16SW,
                                    ),
                                  )
                                : const SizedBox()
                            : const SizedBox(),
                      ],
                    ),
                    Text(
                      detail,
                      style: TextStyle(
                        color: MyColors.blue,
                        fontFamily: 'Roboto-Medium',
                        fontSize: MySizes.size16SW,
                        wordSpacing: -1,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                enable ? MyIcons.forwardArrow : null,
                size: MySizes.size24SW,
              )
            ],
          ),
        ),
      ),
    );
  }
}
