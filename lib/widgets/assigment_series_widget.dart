import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignment_series_response.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class AssignmentSeriesWidget extends StatefulWidget {
  final AssignmentSeries assignmentSeries;
  const AssignmentSeriesWidget({
    super.key,
    required this.assignmentSeries,
  });

  @override
  State<AssignmentSeriesWidget> createState() => _AssignmentSeriesWidgetState();
}

class _AssignmentSeriesWidgetState extends State<AssignmentSeriesWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.ASSIGNMENT, arguments: widget.assignmentSeries);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MySizes.size20SW, vertical: MySizes.size5SW),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MySizes.size20SW),
            border:
                Border.all(width: MySizes.size1SW, color: MyColors.lightGrey),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MySizes.size20SW, vertical: MySizes.size20SW),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.assignmentSeries.title ?? '',
                  style: MyTextStyles.content20BoldBlackSW,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: MySizes.size10SW),
                Container(
                  padding: EdgeInsets.all(MySizes.size10SW),
                  decoration: BoxDecoration(
                    color: widget.assignmentSeries.status == 1
                        ? Colors.cyan
                        : widget.assignmentSeries.status == 2
                            ? MyColors.green
                            : MyColors.red,
                    borderRadius: BorderRadius.circular(MySizes.size10SW),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.assignmentSeries.status == 1
                            ? 'Sắp diễn ra'
                            : widget.assignmentSeries.status == 2
                                ? 'Đang diễn ra'
                                : 'Đã kết thúc',
                        style: MyTextStyles.content17MediumWhiteSW,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: MySizes.size10SW),
                      Icon(
                        Icons.groups_sharp,
                        color: MyColors.white,
                        size: MySizes.size25SW,
                      ),
                      SizedBox(width: MySizes.size5SW),
                      Text(
                        widget.assignmentSeries.totalUsers.toString(),
                        style: MyTextStyles.content17MediumWhiteSW,
                      )
                    ],
                  ),
                ),
                SizedBox(height: MySizes.size10SW),
                Padding(
                  padding: EdgeInsets.only(top: MySizes.size5SW),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            size: MySizes.size24SW,
                            color: MyColors.grey,
                          ),
                          SizedBox(width: MySizes.size5SW),
                          Text(
                            'Bắt đầu :  ${widget.assignmentSeries.startTime}',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontFamily: 'Roboto-Regular',
                              fontSize: MySizes.size17SW,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(height: MySizes.size5SW),
                      Row(
                        children: [
                          Icon(
                            Icons.access_alarm,
                            size: MySizes.size24SW,
                            color: MyColors.grey,
                          ),
                          SizedBox(width: MySizes.size5SW),
                          Text(
                            'Kết thúc : ${widget.assignmentSeries.endTime}',
                            style: TextStyle(
                              color: MyColors.grey,
                              fontFamily: 'Roboto-Regular',
                              fontSize: MySizes.size17SW,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
