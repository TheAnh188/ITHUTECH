import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_handle.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/notification_list_tile.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  late bool changeDependencies;
  late Future<bool> handleGetAnnouncements;
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

  AnnouncementsHandle get _announcementsHandle =>
      Get.find<AnnouncementsHandle>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (changeDependencies == false) {
      Group group = ModalRoute.of(context)?.settings.arguments as Group;
      handleGetAnnouncements =
          _announcementsHandle.handleGetAnnouncements(group.id!);
      setState(() {
        changeDependencies = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Group group = ModalRoute.of(context)?.settings.arguments as Group;
    return FutureBuilder<Object>(
        future: handleGetAnnouncements,
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
                    return _announcementsHandle
                        .handleGetAnnouncements(group.id!);
                  },
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    slivers: [
                      SliverAppBar(
                        title: Text(
                          'Thông Báo',
                          style: MyTextStyles.content25MediumBlackSW,
                        ),
                        centerTitle: true,
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
                              () => _announcementsHandle
                                      .announcements.isNotEmpty
                                  ? ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: _announcementsHandle
                                          .announcements.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: NotificationListTile(
                                            announcement: _announcementsHandle
                                                .announcements[index],
                                            index: false,
                                          ),
                                        );
                                      },
                                    )
                                  : AspectRatio(
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
                                          "Không tìm thấy thông báo",
                                          style:
                                              MyTextStyles.content18BoldBlackSW,
                                        ),
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
        });
  }
}

Widget appBar(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Thông Báo',
        style: MyTextStyles.content25MediumBlackSW,
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      toolbarHeight: MySizes.size85SW,
      leadingWidth: MySizes.size65SW,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: const BackArrowButton(),
    ),
  );
}
