import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class CheckInWidget extends StatelessWidget {
  final String subjectTitle;
  const CheckInWidget({super.key, required this.subjectTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () async {
        await loading();
        await dissmis();
        if (context.mounted) {
          Navigator.pushNamed(context, '/qr');
        }
      },
      child: SizedBox(
        height: MySizes.size50SW,
        child: ListTile(
          trailing: Icon(
            MyIcons.qr,
            size: MySizes.size30SW,
            color: MyColors.lightBlue,
          ),
          title: Text(
            subjectTitle,
            style: MyTextStyles.content18RegularBlackSW,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
