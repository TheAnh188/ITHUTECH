import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_handle.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_response.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_result_response.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/check_in_detail_list_tile.dart';

class CheckInDetailPage extends StatefulWidget {
  const CheckInDetailPage({super.key});

  @override
  State<CheckInDetailPage> createState() => CheckInDetailPageState();
}

class CheckInDetailPageState extends State<CheckInDetailPage> {
  late bool changeDependencies;
  late Future<bool> handleGetCheckInResults;

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
    List<CheckInResult>? list,
  ) {
    int order = 1;
    return list!.map((index) {
      return CheckInDetailListTile(
        result: index,
        index: order++,
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
      CheckIn checkIn = ModalRoute.of(context)?.settings.arguments as CheckIn;

      handleGetCheckInResults =
          _checkInHandle.handleGetCheckInResults(checkIn.id!);
      setState(() {
        changeDependencies = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CheckIn checkIn = ModalRoute.of(context)?.settings.arguments as CheckIn;
    return FutureBuilder(
      future: handleGetCheckInResults,
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
                  return _checkInHandle.handleGetCheckInResults(checkIn.id!);
                },
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      title: Text(
                        checkIn.title ?? '',
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
                            () => _checkInHandle.checkInResults.isNotEmpty
                                ? Column(
                                    children: widgets(
                                      _checkInHandle.checkInResults,
                                    ),
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
                                        "Không tìm thấy lịch sử điểm danh",
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
        return appBar(context, checkIn.title ?? '');
      },
    );
  }
}

Widget appBar(BuildContext context, String title) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        title,
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
