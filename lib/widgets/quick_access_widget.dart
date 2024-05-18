import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class QuickAccessWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const QuickAccessWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MySizes.size65SW,
          width: MySizes.size65SW,
          decoration: BoxDecoration(
            border: Border.all(
              width: MySizes.size8SW,
              color: MyColors.grey.withOpacity(.2),
            ),
            color: MyColors.white,
            borderRadius: BorderRadius.circular(MySizes.size22SW),
          ),
          child: Icon(
            icon,
            color: MyColors.blue,
            size: MySizes.size20SW,
          ),
        ),
        SizedBox(height: MySizes.size5SW),
        Text(
          title,
          style: MyTextStyles.content15RegularBlackSW,
        )
      ],
    );
  }
}
