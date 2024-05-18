import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_response.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class NotificationListTile extends StatefulWidget {
  final Announcement announcement;
  final bool index;
  const NotificationListTile(
      {super.key, required this.announcement, required this.index});

  @override
  State<NotificationListTile> createState() => _NotificationListTileState();
}

class _NotificationListTileState extends State<NotificationListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.index == false ? MyColors.blue.withOpacity(.1) : null,
      padding: EdgeInsets.symmetric(
          horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: MyColors.grey,
            radius: MySizes.size30SW,
            child: Icon(
              MyIcons.account,
              size: MySizes.size30SW,
              color: MyColors.white,
            ),
          ),
          SizedBox(width: MySizes.size10SW),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: MyTextStyles.content18BoldBlackSW,
                    children: [
                      TextSpan(text: '${widget.announcement.nickname ?? ''} '),
                      TextSpan(
                          text: 'đã đăng một thông báo với tiêu đề',
                          style: MyTextStyles.content18RegularBlackSW),
                      TextSpan(text: ' ${widget.announcement.title}'),
                    ],
                  ),
                ),
                Text(
                  widget.announcement.createdAt ?? '',
                  style: MyTextStyles.content14MediumDarkBlueSW,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
