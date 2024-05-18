import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignment_series_response.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignments_handle.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/problems_response.dart';
import 'package:hutech_check_in_app/pages/loading_page/loading_problems_page.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
import 'package:hutech_check_in_app/widgets/problem_list_tile.dart';

class ProblemsPage extends StatefulWidget {
  const ProblemsPage({super.key});

  @override
  State<ProblemsPage> createState() => _ProblemsPagesPageState();
}

class _ProblemsPagesPageState extends State<ProblemsPage>
    with TickerProviderStateMixin {
  late bool changeDependencies;
  late Future<bool> handleGetProblems;
  late bool _loading;
  late Timer _loadingTimer;
  late bool _isDisposed;

  @override
  void initState() {
    super.initState();
    _isDisposed = false;
    _loadingTimer = Timer(Duration.zero, () {});
    _loading = false;
    changeDependencies = false;
  }

  List<Widget> assignmentWidgets(
    List<Problems>? list,
  ) {
    return list!.map((index) {
      return ProblemListTile(
        problem: index,
      );
    }).toList();
  }

  @override
  void dispose() {
    _loadingTimer.cancel();
    _isDisposed = true;
    super.dispose();
  }

  void _widgetLoading() {
    _loadingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _loading = false;
      });
      timer.cancel();
    });
  }

  void _loadinggg() async {
    await loading();
  }

  void _dissmis() async {
    await dissmis();
  }

  AssignmentsHandle get _assignmentsHandle => Get.find<AssignmentsHandle>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (changeDependencies == false) {
      AssignmentSeries assignmentSeries =
          ModalRoute.of(context)?.settings.arguments as AssignmentSeries;
      handleGetProblems =
          _assignmentsHandle.handleGetProblems(assignmentSeries.id!);
      setState(() {
        changeDependencies = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AssignmentSeries assignmentSeries =
        ModalRoute.of(context)?.settings.arguments as AssignmentSeries;
    return FutureBuilder<Object>(
        future: handleGetProblems,
        builder: (context, snapshott) {
          if (snapshott.data == true) {
            _dissmis();
            return Scaffold(
              body: RefreshIndicator(
                edgeOffset: MySizes.size50SW,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                displacement: MySizes.size50SW,
                strokeWidth: MySizes.size2SW,
                backgroundColor: MyColors.blue,
                color: MyColors.white,
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 1), () {
                    if (!_isDisposed) {
                      setState(() {
                        _loading = true;
                      });
                      _widgetLoading();
                      _assignmentsHandle
                          .handleGetProblems(assignmentSeries.id!);
                    }
                  });
                },
                child: CustomScrollView(
                  physics: _loading
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                  slivers: [
                    SliverAppBar(
                      centerTitle: true,
                      floating: true,
                      pinned: false,
                      snap: false,
                      scrolledUnderElevation: 0,
                      toolbarHeight: MySizes.size85SW,
                      leadingWidth: MySizes.size65SW,
                      backgroundColor: MyColors.darkBlue,
                      title: Text(
                        'Bài tập',
                        style: MyTextStyles.content20MediumWhiteSW,
                      ),
                      leading: const BackArrowButton(
                        color: MyColors.white,
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: MySizes.size20SW),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    // showDragHandle: true,
                                    constraints: BoxConstraints.expand(
                                      width: Get.width,
                                      height:
                                          0.16 * Get.height + MySizes.size25SW,
                                    ),
                                    context: context,
                                    builder: (builder) {
                                      return Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: MySizes.size25SW,
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: ListTile(
                                                  minVerticalPadding:
                                                      MySizes.size10SW,
                                                  onTap: () {
                                                    Get.toNamed(Routes.RANKING,
                                                        arguments:
                                                            assignmentSeries);
                                                  },
                                                  leading: Icon(MyIcons.rank,
                                                      size: MySizes.size24SW),
                                                  title: Text(
                                                    'Xếp hạng',
                                                    style: MyTextStyles
                                                        .content18RegularBlackSW,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: ListTile(
                                                  onTap: () {
                                                    Get.toNamed(Routes.FEEDBACK,
                                                        arguments:
                                                            assignmentSeries);
                                                  },
                                                  minVerticalPadding:
                                                      MySizes.size10SW,
                                                  leading: Icon(MyIcons.message,
                                                      size: MySizes.size24SW),
                                                  title: Text(
                                                    'Thắc mắc',
                                                    style: MyTextStyles
                                                        .content18RegularBlackSW,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  MyIcons.more,
                                  size: MySizes.size24SW,
                                  color: MyColors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          _loading
                              ? const LoadingAssignmentPage()
                              : Column(
                                  children: [
                                    SizedBox(height: MySizes.size30SW),
                                    Obx(
                                      () => _assignmentsHandle
                                              .problems.isNotEmpty
                                          ? Column(
                                              children: assignmentWidgets(
                                                _assignmentsHandle.problems,
                                              ),
                                            )
                                          : AspectRatio(
                                              aspectRatio: 1 / 1,
                                              child: Container(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      Images.nothing,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  "Không tìm thấy bài tập",
                                                  style: MyTextStyles
                                                      .content18BoldBlackSW,
                                                ),
                                              ),
                                            ),
                                    ),
                                  ],
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
      scrolledUnderElevation: 0,
      toolbarHeight: MySizes.size85SW,
      leadingWidth: MySizes.size65SW,
      backgroundColor: MyColors.darkBlue,
      leading: const BackArrowButton(
        color: MyColors.white,
      ),
    ),
  );
}
