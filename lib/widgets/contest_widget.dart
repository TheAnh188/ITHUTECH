import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/contests_page/api/contests_response.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class ContestWidget extends StatelessWidget {
  final Contest contest;
  const ContestWidget({super.key, required this.contest});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await loading();
        await dissmis();
        if (context.mounted) {
          Navigator.pushNamed(context, '/detail_contest', arguments: contest);
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySizes.size15SW),
        ),
        margin: EdgeInsets.fromLTRB(
            MySizes.size20SW, 0, MySizes.size20SW, MySizes.size20SW),
        shadowColor: MyColors.lightGrey,
        elevation: MySizes.size5SW,
        child: Container(
          padding: EdgeInsets.all(MySizes.size15SW),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contest.title ?? '',
                style: MyTextStyles.content22MediumBlueSW,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: MySizes.size10SW),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: MySizes.size5SW, horizontal: MySizes.size15SW),
                // height: MySizes.size40SW,
                width: contest.isEnrolled == 1
                    ? MySizes.size165SW
                    : MySizes.size190SW,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColors.blue,
                    borderRadius: BorderRadius.circular(MySizes.size15SW)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      contest.isEnrolled == 1
                          ? 'Đã tham gia'
                          : 'Không tham gia',
                      style: MyTextStyles.content15MediumWhiteSW,
                    ),
                    SizedBox(width: MySizes.size10SW),
                    Row(
                      children: [
                        Icon(
                          MyIcons.account,
                          size: MySizes.size15SW,
                          color: MyColors.white,
                        ),
                        SizedBox(width: MySizes.size5SW),
                        Text(
                          contest.userCount.toString(),
                          // '100',
                          style: MyTextStyles.content15MediumWhiteSW,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
