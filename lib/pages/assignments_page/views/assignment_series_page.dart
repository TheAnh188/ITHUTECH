import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/animation/loading_dialog.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignments_handle.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignment_series_response.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/assigment_series_widget.dart';
import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';

class AssignmentSeriesPage extends StatefulWidget {
  const AssignmentSeriesPage({super.key});

  @override
  State<AssignmentSeriesPage> createState() => _AssignmentSeriesPageState();
}

class _AssignmentSeriesPageState extends State<AssignmentSeriesPage> {
  late bool changeDependencies;
  late Future<bool> handleGetAssignmentSeries;

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

  List<Widget> assignmentSeriesWidgets(
    List<AssignmentSeries>? list,
  ) {
    return list!.map((index) {
      return AssignmentSeriesWidget(
        assignmentSeries: index,
      );
    }).toList();
  }

  AssignmentsHandle get _assignmentsHandle => Get.find<AssignmentsHandle>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (changeDependencies == false) {
      Group group = ModalRoute.of(context)?.settings.arguments as Group;
      handleGetAssignmentSeries =
          _assignmentsHandle.handleGetAssignmentSeries(group.id!);
      setState(() {
        changeDependencies = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Group group = ModalRoute.of(context)?.settings.arguments as Group;
    return FutureBuilder<Object>(
      future: handleGetAssignmentSeries,
      builder: (context, snapshott) {
        if (snapshott.data == true) {
          _dissmis();
          return Scaffold(
            backgroundColor: const Color(0xFFF5F7F8),
            body: RefreshIndicator(
              edgeOffset: MySizes.size50SW,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              displacement: MySizes.size50SW,
              strokeWidth: MySizes.size2SW,
              backgroundColor: MyColors.blue,
              color: MyColors.white,
              onRefresh: () {
                return _assignmentsHandle.handleGetAssignmentSeries(group.id!);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: Column(
                  children: [
                    appBar(),
                    SizedBox(height: MySizes.size20SW),
                    Obx(
                      () => _assignmentsHandle.assignmentSeries.isNotEmpty
                          ? Column(
                              children: assignmentSeriesWidgets(
                                _assignmentsHandle.assignmentSeries,
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
                                  "Không tìm chấy chuỗi bài tập",
                                  style: MyTextStyles.content18BoldBlackSW,
                                ),
                              ),
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
        return Scaffold(
          backgroundColor: const Color(0xFFF5F7F8),
          body: appBar(),
        );
      },
    );
  }

  Widget appBar() {
    final padding = MediaQuery.of(context).viewPadding.top;
    return Container(
      padding: EdgeInsets.only(top: padding),
      height: MySizes.size150SW + padding,
      decoration: BoxDecoration(
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackArrowButton(
                  color: MyColors.white,
                ),
              ],
            ),
            SizedBox(height: MySizes.size20SW),
            Row(
              children: [
                Icon(
                  Icons.archive,
                  color: MyColors.white,
                  size: MySizes.size30SW,
                ),
                SizedBox(width: MySizes.size8SW),
                Text(
                  'Chuỗi bài tập',
                  style: MyTextStyles.content20BoldWhiteSW,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
