import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/pages/members_page/api/members_handle.dart';
import 'package:hutech_check_in_app/pages/members_page/api/members_response.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/member_widget.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  late bool changeDependencies;
  late Future<bool> handleGetMembers;
  @override
  void initState() {
    super.initState();
    changeDependencies = false;
  }

  void _loadinggg() async {
    await loading();
  }

  void _dissmis() async {
    await dissmis();
  }

  List<Widget> memberWidgets(
    List<Member>? list,
  ) {
    return list!.map((index) {
      return MemberWidget(
        member: index,
      );
    }).toList();
  }

  MembersHandle get _membersHandle => Get.find<MembersHandle>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (changeDependencies == false) {
      Group group = ModalRoute.of(context)?.settings.arguments as Group;
      handleGetMembers = _membersHandle.handleGetMembers(group.id!);
      setState(() {
        changeDependencies = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Group dataProvider = ModalRoute.of(context)?.settings.arguments as Group;
    return FutureBuilder(
      future: handleGetMembers,
      builder: (context, snapshott) {
        if (snapshott.data == true) {
          _dissmis();
          return Scaffold(
            body: SafeArea(
              child: RefreshIndicator(
                edgeOffset: MySizes.size50SW,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                displacement: MySizes.size50SW,
                strokeWidth: MySizes.size2SW,
                backgroundColor: MyColors.blue,
                color: MyColors.white,
                onRefresh: () {
                  return _membersHandle.handleGetMembers(dataProvider.id!);
                },
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      pinned: false,
                      snap: false,
                      scrolledUnderElevation: 0,
                      toolbarHeight: MySizes.size85SW,
                      leadingWidth: MySizes.size65SW,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      leading: const BackArrowButton(),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MySizes.size20SW),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Giảng viên',
                                    style: TextStyle(
                                        fontSize: MySizes.size30SW,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.blue),
                                  ),
                                  Divider(
                                    color: MyColors.blueGrey,
                                    height: MySizes.size12SW,
                                    thickness: MySizes.size1SW,
                                  ),
                                  SizedBox(height: MySizes.size10SW),
                                  MemberWidget(
                                    member: _membersHandle.members[0],
                                  ),
                                  SizedBox(height: MySizes.size10SW),
                                  Text(
                                    'Sinh viên',
                                    style: TextStyle(
                                        fontSize: MySizes.size30SW,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.blue),
                                  ),
                                  Divider(
                                    color: MyColors.blueGrey,
                                    height: MySizes.size12SW,
                                    thickness: MySizes.size1SW,
                                  ),
                                  SizedBox(height: MySizes.size10SW),
                                  Column(
                                    children: memberWidgets(
                                      _membersHandle.members,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
        return appBar(context);
      },
    );
  }
}

Widget appBar(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      scrolledUnderElevation: 0,
      toolbarHeight: MySizes.size85SW,
      leadingWidth: MySizes.size65SW,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: const BackArrowButton(),
    ),
  );
}
