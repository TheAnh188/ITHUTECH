import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/account_page/views/account_page.dart';
import 'package:hutech_check_in_app/pages/contests_page/views/contests_page.dart';
import 'package:hutech_check_in_app/pages/courses_page/courses_page.dart';
import 'package:hutech_check_in_app/pages/groups_page/views/groups_page.dart';
import 'package:hutech_check_in_app/pages/home_page/views/home_page.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/bottom_bar.dart';

final dashBoardKey = GlobalKey<DashBoardScreenState>();

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  late final listScreen = [
    const HomePage(),
    const CoursesPage(),
    GroupsPage(key: groupKey),
    const ContestsPage(),
    const AccountPage()
  ];
  var cIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(
        showActiveBackgroundColor: true,
        padding: EdgeInsets.symmetric(
            horizontal: MySizes.size10SW, vertical: MySizes.size10SW),
        itemPadding: EdgeInsets.symmetric(
            vertical: MySizes.size10SW, horizontal: MySizes.size15SW),
        textStyle: MyTextStyles.content16MediumWhiteSW,
        backgroundColor: MyColors.blue,
        selectedIndex: cIndex,
        onTap: (value) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          setState(() {
            cIndex = value;
          });
        },
        items: [
          CustomBottomBarItem(
            inactiveColor: Colors.white.withOpacity(.5),
            icon: Icon(
              Icons.home_outlined,
              size: MySizes.size24SW,
            ),
            title: const Text("Trang chủ"),
            activeColor: Colors.white,
          ),
          CustomBottomBarItem(
            inactiveColor: Colors.white.withOpacity(.5),
            icon: Icon(Icons.assignment_outlined, size: MySizes.size24SW),
            title: const Text("Khoá học"),
            activeColor: Colors.white,
          ),
          CustomBottomBarItem(
            inactiveColor: Colors.white.withOpacity(.5),
            icon: Icon(
              Icons.groups_2_outlined,
              size: MySizes.size24SW,
            ),
            title: const Text("Nhóm lớp"),
            activeColor: Colors.white,
          ),
          CustomBottomBarItem(
            inactiveColor: Colors.white.withOpacity(.5),
            icon: Icon(
              Icons.leaderboard_outlined,
              size: MySizes.size24SW,
            ),
            title: const Text("Cuộc thi"),
            activeColor: Colors.white,
          ),
          CustomBottomBarItem(
            inactiveColor: Colors.white.withOpacity(.5),
            icon: Icon(
              Icons.settings_suggest_outlined,
              size: MySizes.size24SW,
            ),
            title: const Text("Tài khoản"),
            activeColor: Colors.white,
          ),
        ],
      ),
      body: IndexedStack(
        index: cIndex,
        children: listScreen,
      ),
    );
  }
}
