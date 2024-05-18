import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_response.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class CheckInListTile extends StatelessWidget {
  final CheckIn checkIn;
  const CheckInListTile({super.key, required this.checkIn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                checkIn.title ?? '',
                style: MyTextStyles.content18MediumBlackSW,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                checkIn.createdAt ?? '',
                style: MyTextStyles.content14MediumDarkBlueSW,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.CHECK_IN_DETAIL, arguments: checkIn);
            },
            child: Container(
              padding: EdgeInsets.all(MySizes.size10SW),
              decoration: BoxDecoration(
                color: MyColors.darkBlue,
                borderRadius:
                    BorderRadiusDirectional.circular(MySizes.size10SW),
              ),
              child: Text(
                'Xem chi tiết',
                style: MyTextStyles.content17MediumWhiteSW,
              ),
            ),
          )
          // Icon(Icons.check_circle,
          //     color: MyColors.green, size: MySizes.size24SW),
        ],
      ),
    );
  }
}
