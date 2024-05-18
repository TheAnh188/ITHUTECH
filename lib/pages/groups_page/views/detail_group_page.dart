import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_handle.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';

class DetailGroupPage extends StatefulWidget {
  const DetailGroupPage({super.key});

  @override
  State<DetailGroupPage> createState() => _DetailGroupPageState();
}

class _DetailGroupPageState extends State<DetailGroupPage> {
  var key = GlobalKey<ScaffoldState>();

  late Future<bool> handleGetUserGroup;
  late bool changeDependencies;

  late List<String> titles = [
    'Tổng điểm',
    'Số lượng bài tập',
    'Số bài đã làm',
  ];

  late List<IconData> icons = [
    Icons.score,
    CupertinoIcons.asterisk_circle_fill,
    Icons.assignment,
  ];

  GroupsHandle get _groupsHandle => Get.find<GroupsHandle>();

  late List info = [
    _groupsHandle.groupUser[0].totalScore ?? 0,
    _groupsHandle.groupUser[0].totalProblems,
    _groupsHandle.groupUser[0].totalSolutions,
  ];

  @override
  void initState() {
    super.initState();
    changeDependencies = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (changeDependencies == false) {
      Group group = ModalRoute.of(context)?.settings.arguments as Group;
      handleGetUserGroup = _groupsHandle.handleGetUserGroup(group.id!);
      setState(() {
        changeDependencies = true;
      });
    }
  }

  void _loadinggg() async {
    await loading();
  }

  void _dissmis() async {
    await dissmis();
  }

  List<Widget> widgets(
    List<IconData> icons,
    List<dynamic> info,
    List<String> titles,
  ) {
    List<int> indexes = [0, 1, 2];
    return indexes.map((index) {
      return Padding(
        padding: EdgeInsets.only(
          top: MySizes.size5SW,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icons[index],
                  size: MySizes.size24SW,
                  color: MyColors.grey,
                ),
                SizedBox(width: MySizes.size5SW),
                Text(
                  titles[index],
                  style: MyTextStyles.content18MediumBlackSW,
                ),
              ],
            ),
            Text(
              info[index].toString(),
              style: MyTextStyles.content18MediumBlackSW,
            )
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Group group = ModalRoute.of(context)?.settings.arguments as Group;
    return FutureBuilder<Object>(
      future: handleGetUserGroup,
      builder: (context, snapshott) {
        if (snapshott.data == true) {
          _dissmis();
          return Scaffold(
            key: key,
            backgroundColor: const Color(0xFFF5F7F8),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(
                    () => appBar(group, true),
                  ),
                  Transform.translate(
                    offset: Offset(0, -MySizes.size80SW),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: MySizes.size20SW),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(MySizes.size20SW),
                          border: Border.all(
                              width: MySizes.size1SW,
                              color: MyColors.lightGrey),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: MySizes.size20SW,
                              vertical: MySizes.size20SW),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Container(
                                    padding: EdgeInsets.all(MySizes.size10SW),
                                    decoration: BoxDecoration(
                                        color: MyColors.blue,
                                        borderRadius: BorderRadius.circular(
                                            MySizes.size30SW)),
                                    child: Text(
                                      'Thông tin nhóm/lớp',
                                      style:
                                          MyTextStyles.content17MediumWhiteSW,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: MySizes.size10SW),
                              Obx(
                                () => Text(
                                  _groupsHandle.groupUser[0].nickname ?? '',
                                  style: MyTextStyles.content20MediumBlackSW,
                                ),
                              ),
                              Obx(
                                () => Column(
                                  children: widgets(icons, info, titles),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -MySizes.size40SW),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button(
                          MyColors.green,
                          MyIcons.assignmentOutlined,
                          'Bài tập',
                          Routes.ASSIGNMENT_SERIES,
                          group,
                        ),
                        SizedBox(width: MySizes.size25SW),
                        button(
                          MyColors.orange,
                          MyIcons.qr,
                          'Điểm danh',
                          Routes.CHECK_IN,
                          group,
                        ),
                        SizedBox(width: MySizes.size25SW),
                        button(
                          MyColors.darkBlue,
                          MyIcons.notifications,
                          'Thông báo',
                          Routes.ANNOUNCEMENT,
                          group,
                        ),
                        SizedBox(width: MySizes.size25SW),
                        button(
                          MyColors.red,
                          MyIcons.account,
                          'Thành viên',
                          Routes.MEMBER,
                          group,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (snapshott.connectionState == ConnectionState.waiting) {
          _loadinggg();
        }
        if (snapshott.data == false) {
          _dissmis();
        }
        return Scaffold(
          body: appBar(null, false),
        );
      },
    );
  }

  Widget button(
      Color color, IconData icon, String title, String route, Group group) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(route, arguments: group);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(MySizes.size20SW),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(MySizes.size20SW),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MySizes.size10SW),
                boxShadow: [
                  BoxShadow(
                    blurRadius: MySizes.size30SW,
                    spreadRadius: MySizes.size8SW,
                    color: MyColors.black.withOpacity(.4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: MySizes.size24SW,
                color: MyColors.white,
              ),
            ),
          ),
          SizedBox(height: MySizes.size5SW),
          Text(
            title,
            style: MyTextStyles.content16RegularBlackSW,
          )
        ],
      ),
    );
  }

  Widget appBar(Object? dataProvider, bool onTap) {
    final padding = MediaQuery.of(context).viewPadding.top;
    return Container(
      padding: EdgeInsets.only(top: padding),
      height: MySizes.size200SW + padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(MySizes.size50SW),
          bottomRight: Radius.circular(MySizes.size50SW),
        ),
        gradient: LinearGradient(
          colors: [
            MyColors.darkBlue,
            MyColors.darkBlue.withOpacity(.9),
          ],
          begin: Alignment.center,
          end: const Alignment(0.4, 0),
          tileMode: TileMode.repeated,
          transform: const GradientRotation(2.2),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: MySizes.size20SW, top: MySizes.size10SW),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MySizes.size20SW),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackArrowButton(
                  color: MyColors.white,
                ),
                // GestureDetector(
                //   onTap: () => key.currentState?.openDrawer(),
                //   child: Icon(
                //     MyIcons.menu,
                //     color: MyColors.white,
                //     size: MySizes.size24SW,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(right: MySizes.size30SW),
                  child: GestureDetector(
                    onTap: onTap
                        ? () {
                            Get.toNamed(Routes.GROUP_INTRO,
                                arguments: dataProvider);
                          }
                        : null,
                    child: Icon(
                      MyIcons.info,
                      size: MySizes.size24SW,
                      color: MyColors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MySizes.size10SW),
            Text(
              dataProvider != null
                  ? _groupsHandle.groupUser[0].className ?? ''
                  : '',
              style: MyTextStyles.content20MediumWhiteSW,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
