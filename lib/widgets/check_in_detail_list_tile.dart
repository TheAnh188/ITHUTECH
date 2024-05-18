import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_result_response.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class CheckInDetailListTile extends StatelessWidget {
  final CheckInResult result;
  final int index;
  const CheckInDetailListTile(
      {super.key, required this.result, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MySizes.size20SW, vertical: MySizes.size5SW),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lần $index',
                style: MyTextStyles.content18MediumBlackSW,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                '${result.createdAt}',
                style: TextStyle(
                  color: MyColors.darkBlue,
                  fontFamily: 'Roboto-Medium',
                  fontSize: MySizes.size16SW,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          Icon(
            result.manualCheckinBy == 0
                ? FontAwesomeIcons.qrcode
                : FontAwesomeIcons.pencil,
            color: MyColors.darkBlue,
            size: MySizes.size24SW,
          ),
        ],
      ),
    );
  }
}
