import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/problems_response.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';

class ProblemListTile extends StatefulWidget {
  final Problems problem;

  const ProblemListTile({
    super.key,
    required this.problem,
  });

  @override
  State<ProblemListTile> createState() => _ProblemListTileState();
}

class _ProblemListTileState extends State<ProblemListTile> {
  void _onTap() {
    Get.toNamed(Routes.DETAIL_ASSIGNMENT, arguments: widget.problem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MySizes.size15SW),
        ),
        margin: EdgeInsets.only(
          left: MySizes.size20SW,
          right: MySizes.size20SW,
          bottom: MySizes.size8SW,
        ),
        child: Container(
          height: MySizes.size85SW,
          alignment: Alignment.center,
          child: ListTile(
            minVerticalPadding: 20,
            leading: Container(
              padding: EdgeInsets.all(MySizes.size5SW),
              decoration: const BoxDecoration(
                  color: MyColors.blue, shape: BoxShape.circle),
              child: Icon(
                MyIcons.assignmentOutlined,
                size: MySizes.size20SW,
                color: MyColors.white,
              ),
            ),
            title: Text(
              widget.problem.title ?? '',
              style: MyTextStyles.content14MediumBlackSW,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${widget.problem.solved}/${widget.problem.submit}',
              style: MyTextStyles.content12MediumBlackSW,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
