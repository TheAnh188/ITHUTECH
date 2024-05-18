import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_handle.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_response.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/check_in_list_tile.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => CheckInPageState();
}

class CheckInPageState extends State<CheckInPage> {
  late bool changeDependencies;
  late Future<bool> handleGetCheckIn;

  @override
  void initState() {
    super.initState();
    changeDependencies = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> widgets(
    List<CheckIn>? list,
  ) {
    return list!.map((index) {
      return CheckInListTile(
        checkIn: index,
      );
    }).toList();
  }

  void _loadinggg() async {
    await loading();
  }

  void _dissmis() async {
    await dissmis();
  }

  CheckInHandle get _checkInHandle => Get.find<CheckInHandle>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (changeDependencies == false) {
      Group group = ModalRoute.of(context)?.settings.arguments as Group;
      handleGetCheckIn = _checkInHandle.handleGetCheckIn(group.id!);
      setState(() {
        changeDependencies = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Group group = ModalRoute.of(context)?.settings.arguments as Group;
    return FutureBuilder(
      future: handleGetCheckIn,
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
                  return _checkInHandle.handleGetCheckIn(group.id!);
                },
                child: Stack(
                  children: [
                    CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      slivers: [
                        SliverAppBar(
                          centerTitle: true,
                          title: Text(
                            'Điểm danh',
                            style: MyTextStyles.content22MediumBlackSW,
                          ),
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
                                () => _checkInHandle.checkIns.isNotEmpty
                                    ? Column(
                                        children:
                                            widgets(_checkInHandle.checkIns),
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
                                            "Không tìm thấy buổi điểm danh",
                                            style: MyTextStyles
                                                .content18BoldBlackSW,
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => _checkInHandle.checkIns.isNotEmpty
                          ? Positioned.fill(
                              bottom: MySizes.size50SW,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: MySizes.size30SW),
                                  height: MySizes.size50SW,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await _checkInHandle.handleCheckDevice();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      splashFactory: NoSplash.splashFactory,
                                      backgroundColor: MyColors.blue,
                                      disabledBackgroundColor:
                                          MyColors.grey.withOpacity(.7),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Điểm danh',
                                        style:
                                            MyTextStyles.content20MediumWhiteSW,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
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
      centerTitle: true,
      title: Text(
        'Điểm danh',
        style: MyTextStyles.content22MediumBlackSW,
      ),
      scrolledUnderElevation: 0,
      toolbarHeight: MySizes.size85SW,
      leadingWidth: MySizes.size65SW,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: const BackArrowButton(),
    ),
  );
}
