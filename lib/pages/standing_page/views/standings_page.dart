import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignment_series_response.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_handle.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_response.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/ranking_list_tile.dart';
import 'package:hutech_check_in_app/widgets/ranking_widget.dart';

class StandingPage extends StatefulWidget {
  const StandingPage({super.key});

  @override
  State<StandingPage> createState() => _StandingPageState();
}

class _StandingPageState extends State<StandingPage> {
  late bool changeDependencies;
  late Future<bool> handleGetStanding;
  @override
  void initState() {
    super.initState();
    changeDependencies = false;
  }

  List<Widget> rankingWidgets(
    List<Standing>? list,
  ) {
    int ranking = 1;
    return list!.map((index) {
      return RankingListTile(
        standing: index,
        ranking: ranking++,
      );
    }).toList();
  }

  void _loadinggg() async {
    await loading();
  }

  void _dissmis() async {
    await dissmis();
  }

  StandingHandle get _standingHandle => Get.find<StandingHandle>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (changeDependencies == false) {
      AssignmentSeries assignmentSeries =
          ModalRoute.of(context)?.settings.arguments as AssignmentSeries;
      handleGetStanding =
          _standingHandle.handleGetStandings(assignmentSeries.id!);
      setState(() {
        changeDependencies = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // AssignmentSeries assignmentSeries =
    //     ModalRoute.of(context)?.settings.arguments as AssignmentSeries;
    return FutureBuilder<Object>(
        future: handleGetStanding,
        builder: (context, snapshott) {
          if (snapshott.data == true) {
            _dissmis();
            return Scaffold(
              body: SafeArea(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      title: Text('Bảng xếp hạng',
                          style: MyTextStyles.content22MediumBlackSW),
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
                            () => _standingHandle.standings.isNotEmpty
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          RankingWidget(
                                            height: MySizes.size130SW,
                                            path:
                                                'assets/images/silver-medal.png',
                                            standing:
                                                _standingHandle.standings[1],
                                            ranking: 2,
                                            color: MyColors.lightBlueAccent,
                                            style: MyTextStyles
                                                .content90BoldWhiteSW,
                                          ),
                                          RankingWidget(
                                            height: MySizes.size160SW,
                                            path:
                                                'assets/images/gold-medal.png',
                                            standing:
                                                _standingHandle.standings[0],
                                            ranking: 1,
                                            color: MyColors.lightBlue,
                                            style: MyTextStyles
                                                .content100BoldWhiteSW,
                                          ),
                                          RankingWidget(
                                            height: MySizes.size110SW,
                                            path:
                                                'assets/images/bronze-medal.png',
                                            standing:
                                                _standingHandle.standings[2],
                                            ranking: 3,
                                            color: MyColors.lightBlueAccent,
                                            style: MyTextStyles
                                                .content80BoldWhiteSW,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: MySizes.size20SW),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MySizes.size5SW),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: MySizes.size20SW),
                                          decoration: BoxDecoration(
                                            color: Colors.lightBlueAccent
                                                .withOpacity(.2),
                                            borderRadius: BorderRadius.circular(
                                                MySizes.size18SW),
                                          ),
                                          child: Column(
                                            children: rankingWidgets(
                                              _standingHandle.standings,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: MySizes.size20SW),
                                    ],
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
                                        "Không tìm thấy bảng xếp hạng",
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
      centerTitle: true,
      title: Text('Bảng xếp hạng', style: MyTextStyles.content22MediumBlackSW),
      scrolledUnderElevation: 0,
      toolbarHeight: MySizes.size85SW,
      leadingWidth: MySizes.size65SW,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: const BackArrowButton(),
    ),
  );
}
