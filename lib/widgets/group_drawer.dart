// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/data/check.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_handle.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/pages/groups_page/views/groups_page.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:provider/provider.dart';

class GroupDrawer extends StatefulWidget {
  const GroupDrawer({super.key});

  @override
  State<GroupDrawer> createState() => _GroupDrawerState();
}

class _GroupDrawerState extends State<GroupDrawer> {
  late ExpansionTileController _controller1;
  late ExpansionTileController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = ExpansionTileController();
    _controller2 = ExpansionTileController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  GroupsHandle get _groupsHandle => Get.find<GroupsHandle>();

  List<Widget> expansionTileItems(
    List<Group>? list,
    bool isChecked,
  ) {
    return list!.map((index) {
      return SizedBox(
        height: MySizes.size55SW,
        child: ListTile(
          minVerticalPadding: MySizes.size5SW,
          onTap: () async {
            String? route = ModalRoute.of(context)?.settings.name;
            Provider.of<Check>(context, listen: false).setdrawerCheck =
                isChecked;
            Navigator.pop(context);
            Timer.periodic(const Duration(milliseconds: 500), (timer) {
              index.key.currentState?.onTapListTile(route);
              timer.cancel();
            });

            // }
          },
          title: Text(
            index.subject ?? index.name ?? '',
            overflow: TextOverflow.ellipsis,
            style: MyTextStyles.content18RegularBlackSW,
          ),
        ),
      );
    }).toList();
  }

  void closeDrawer(bool value) async {
    await loading();
    print(ModalRoute.of(context)?.settings.name);
    Provider.of<Check>(navigatorKey.currentContext!, listen: false)
        .setdrawerCheck = value;
    if (mounted) {
      if (ModalRoute.of(context)?.settings.name == Routes.MAIN) {
        groupKey.currentState?.loadingg();
        print(ModalRoute.of(context)?.settings.name);
      }
    }
    Navigator.pop(navigatorKey.currentContext!);
    Navigator.maybePop(navigatorKey.currentContext!);

    await dissmis();
  }

  Color? setColor(bool value) {
    return value ? MyColors.blue : Colors.black;
  }

  void expandExpansionTile(
      ExpansionTileController ec1, ExpansionTileController ec2) {
    if (ec1.isExpanded) {
      ec2.collapse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MySizes.size300SW,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding:
                EdgeInsets.fromLTRB(0, MySizes.size40SW, 0, MySizes.size30SW),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                minVerticalPadding: MySizes.size5SW,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: MySizes.size16SW),
                leading: Icon(MyIcons.group,
                    size: MySizes.size20SW, color: MyColors.black),
                title: Text(
                  'Nhóm/Lớp',
                  style: MyTextStyles.content32BoldBlackWS,
                ),
              ),
            ),
          ),
          ExpansionTile(
            controller: _controller1,
            backgroundColor: Provider.of<Check>(context).getdrawerCheck
                ? MyColors.lightBlueAccent.withOpacity(.1)
                : null,
            collapsedBackgroundColor: Provider.of<Check>(context).getdrawerCheck
                ? MyColors.lightBlueAccent.withOpacity(.1)
                : null,
            shape: InputBorder.none,
            collapsedIconColor: MyColors.black,
            collapsedTextColor: MyColors.black,
            iconColor: setColor(Provider.of<Check>(context).getdrawerCheck),
            textColor: setColor(Provider.of<Check>(context).getdrawerCheck),
            tilePadding: EdgeInsets.only(
                left: 0, right: MySizes.size25SW, top: 0, bottom: 0),
            title: Container(
              height: MySizes.size65SW,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: ListTile(
                onTap: () {
                  closeDrawer(true);
                  // _groupsHandle.handleGetAllGroups();
                },
                minVerticalPadding: 0,
                title: Text(
                  'Đã tham gia',
                  style: TextStyle(
                      fontSize: MySizes.size22SW,
                      fontFamily: 'SF-UI-MEDIUM',
                      color:
                          setColor(Provider.of<Check>(context).getdrawerCheck)),
                ),
                leading: Icon(
                  MyIcons.pen,
                  size: MySizes.size20SW,
                  color: setColor(Provider.of<Check>(context).getdrawerCheck),
                ),
              ),
            ),
            trailing: Icon(
              Icons.arrow_drop_down,
              size: MySizes.size24SW,
              color: setColor(Provider.of<Check>(context).getdrawerCheck),
            ),
            childrenPadding: EdgeInsets.only(left: MySizes.size5SW),
            onExpansionChanged: (isExpanded) {
              expandExpansionTile(
                _controller1,
                _controller2,
              );
            },
            children: expansionTileItems(_groupsHandle.enrolledGroups, true),
          ),
          ExpansionTile(
            controller: _controller2,
            backgroundColor: !Provider.of<Check>(context).getdrawerCheck
                ? MyColors.lightBlueAccent.withOpacity(.1)
                : null,
            collapsedBackgroundColor:
                !Provider.of<Check>(context).getdrawerCheck
                    ? MyColors.lightBlueAccent.withOpacity(.1)
                    : null,
            shape: InputBorder.none,
            collapsedIconColor: MyColors.black,
            collapsedTextColor: MyColors.black,
            iconColor: setColor(!Provider.of<Check>(context).getdrawerCheck),
            textColor: setColor(!Provider.of<Check>(context).getdrawerCheck),
            tilePadding: EdgeInsets.only(
                left: 0, right: MySizes.size25SW, top: 0, bottom: 0),
            title: Container(
              height: MySizes.size65SW,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: ListTile(
                onTap: () {
                  closeDrawer(false);
                  // _groupsHandle.handleGetAllGroups();
                },
                minVerticalPadding: 0,
                leading: Icon(
                  MyIcons.archive,
                  size: MySizes.size20SW,
                  color: setColor(!Provider.of<Check>(context).getdrawerCheck),
                ),
                title: Text(
                  'Đã lưu trữ',
                  style: TextStyle(
                    fontSize: MySizes.size22SW,
                    fontFamily: 'SF-UI-MEDIUM',
                    color:
                        setColor(!Provider.of<Check>(context).getdrawerCheck),
                  ),
                ),
              ),
            ),
            // trailing: Icon(
            //   CupertinoIcons.lock_circle_fill,
            //   size: MySizes.size24SW,
            //   color: setColor(!Provider.of<Check>(context).getdrawerCheck),
            // ),
            trailing: const SizedBox(),
            childrenPadding: EdgeInsets.only(left: MySizes.size5SW),
            // onExpansionChanged: (isExpanded) {
            //   expandExpansionTile(_controller2, _controller1);
            // },
            onExpansionChanged: null,
            // children: expansionTileItems(
            //     _groupsHandle.getArchivedGroupsData(), false, true),
          ),
        ],
      ),
    );
  }
}
