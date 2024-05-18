import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/core/local_storage_repo.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class GroupWidget extends StatefulWidget {
  final Group group;
  final bool isArchived;

  const GroupWidget({super.key, required this.group, required this.isArchived});

  @override
  State<GroupWidget> createState() => GroupWidgetState();
}

class GroupWidgetState extends State<GroupWidget> {
  late String imagePath;
  late Color color;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  void getImages() {
    List<String> images = [
      Images.group1,
      Images.group2,
      Images.group3,
    ];
    List<Color> colors = [
      MyColors.lightGrey,
      MyColors.lightBrown,
    ];
    var i = Random().nextInt(images.length);
    var j = Random().nextInt(colors.length);
    imagePath = images[i];
    color = colors[j];
  }

  void onTapListTile(String? route) async {
    if (route == Routes.DETAIL_GROUP) {
      Get.offNamed(Routes.DETAIL_GROUP);
    } else {
      onTap();
    }
  }

  void onTap() {
    if (widget.isArchived) {
      SnackbarCustom.showWarning(
        title: 'Thông tin',
        message: 'Lớp học đã được lưu trữ',
        context: navigatorKey.currentContext!,
      );
    } else {
      Get.toNamed(Routes.DETAIL_GROUP, arguments: widget.group);
    }
  }

  LocalStorageRepo localRepo = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(
            MySizes.size20SW, 0, MySizes.size20SW, MySizes.size10SW),
        decoration: BoxDecoration(
          border: Border.all(width: MySizes.size1SW, color: MyColors.lightGrey),
          borderRadius: BorderRadius.circular(MySizes.size20SW),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MySizes.size20SW),
                  topRight: Radius.circular(MySizes.size20SW),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: MySizes.size200SW,
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(MySizes.size10SW),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.group.subject ?? widget.group.name ?? '',
                    style: MyTextStyles.content22MediumBlueSW,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    localRepo.getIsAdmin() == false &&
                            localRepo.getIsTeacher() == false
                        ? widget.group.lecturer ?? ''
                        : widget.group.name ?? '',
                    style: MyTextStyles.content18MediumBlackSW,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
