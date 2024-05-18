import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/data/check.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_handle.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/pages/loading_page/loading_groups_page.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/group_drawer.dart';
import 'package:hutech_check_in_app/widgets/group_widget.dart';
import 'package:provider/provider.dart';

final groupKey = GlobalKey<GroupsPageState>();

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => GroupsPageState();
}

class GroupsPageState extends State<GroupsPage> {
  var key = GlobalKey<ScaffoldState>();
  late Timer _loadingTimer;
  late bool _loading;

  GroupsHandle get _groupsHandle => Get.find<GroupsHandle>();

  @override
  void initState() {
    super.initState();
    _loading = false;
    _loadingTimer = Timer(Duration.zero, () {});
  }

  List<Widget> groupWidgets(
    RxList<Group>? list,
    bool isArchived,
  ) {
    return list!.map((index) {
      return GroupWidget(
        key: index.key,
        group: index,
        isArchived: isArchived,
      );
    }).toList();
  }

  void loadingg() {
    _loading = true;
    _loadingTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        _loading = false;
      });
      timer.cancel();
    });
  }

  @override
  void dispose() {
    _loadingTimer.cancel();
    super.dispose();
  }

  void _dissmis() async {
    await dissmis();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _groupsHandle.handleGetAllGroups(),
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          _dissmis();
          return Scaffold(
            key: key,
            drawer: const GroupDrawer(),
            body: SafeArea(
              child: CustomScrollView(
                physics: _loading
                    ? const NeverScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    title: Text(
                      'Nhóm/Lớp',
                      style: MyTextStyles.content25MediumBlackSW,
                    ),
                    centerTitle: true,
                    floating: true,
                    pinned: false,
                    snap: false,
                    scrolledUnderElevation: 0,
                    toolbarHeight: MySizes.size85SW,
                    leadingWidth: MySizes.size65SW,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    leading: IconButton(
                      icon: Icon(
                        MyIcons.menu,
                        size: MySizes.size24SW,
                      ),
                      onPressed: () => key.currentState?.openDrawer(),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      _loading
                          ? [const LoadingGroupsPage()]
                          : Provider.of<Check>(context).getdrawerCheck
                              ? [
                                  Obx(
                                    () => _groupsHandle.enrolledGroups.isEmpty
                                        ? AspectRatio(
                                            aspectRatio: 1 / 1,
                                            child: Container(
                                              alignment: Alignment.bottomCenter,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    Images.nothing,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                "Không tìm thấy nhóm lớp",
                                                style: MyTextStyles
                                                    .content18BoldBlackSW,
                                              ),
                                            ),
                                          )
                                        : ListView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            children: groupWidgets(
                                              _groupsHandle.enrolledGroups,
                                              false,
                                            ),
                                          ),
                                  ),
                                ]
                              : [
                                  Obx(
                                    () => _groupsHandle.archivedGroups.isEmpty
                                        ? AspectRatio(
                                            aspectRatio: 1 / 1,
                                            child: Container(
                                              alignment: Alignment.bottomCenter,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    Images.nothing,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                "Không tìm thấy nhóm lớp",
                                                style: MyTextStyles
                                                    .content18BoldBlackSW,
                                              ),
                                            ),
                                          )
                                        : ListView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            children: groupWidgets(
                                              _groupsHandle.archivedGroups,
                                              true,
                                            ),
                                          ),
                                  ),
                                ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (snapshot.data == false) {
          _dissmis();
        }
        return appBar(context);
      },
    );
  }
}

Widget appBar(BuildContext context) {
  return Scaffold(
    drawer: const Drawer(),
    appBar: AppBar(
      title: Text(
        'Nhóm/Lớp',
        style: MyTextStyles.content30MediumBlackSW,
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      toolbarHeight: MySizes.size85SW,
      leadingWidth: MySizes.size65SW,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: IconButton(
        icon: Icon(
          MyIcons.menu,
          size: MySizes.size24SW,
        ),
        onPressed: () {},
      ),
    ),
  );
}
