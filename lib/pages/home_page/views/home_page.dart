// ignore_for_file: prefer_const_constructors

import 'package:avatar_glow/avatar_glow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_handle.dart';
import 'package:hutech_check_in_app/pages/dashboard/dashboard_screen.dart';
import 'package:hutech_check_in_app/pages/home_page/api/home_handle.dart';
import 'package:hutech_check_in_app/pages/home_page/api/news_response.dart';
import 'package:hutech_check_in_app/pages/loading_page/loading_home_page.dart';
import 'package:hutech_check_in_app/utils/icons.dart';
import 'package:hutech_check_in_app/utils/images.dart';
import 'package:hutech_check_in_app/utils/style.dart';
import 'package:hutech_check_in_app/widgets/indicator.dart';
import 'package:hutech_check_in_app/widgets/list_view_item.dart';
import 'package:hutech_check_in_app/widgets/news_card.dart';
import 'package:hutech_check_in_app/widgets/quick_access_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late CarouselController carouselController;
  late int _pageIndex;

  final _items = [
    const ListViewItem(path: Images.pic0, boxFit: BoxFit.cover),
    const ListViewItem(path: Images.pic1, boxFit: BoxFit.cover),
    const ListViewItem(path: Images.pic2, boxFit: BoxFit.cover),
    const ListViewItem(path: Images.pic3, boxFit: BoxFit.cover),
    const ListViewItem(path: Images.pic4, boxFit: BoxFit.cover),
  ];

  @override
  void initState() {
    super.initState();
    _pageIndex = 0;
    carouselController = CarouselController();
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  void accessPage(String route, int? index) {
    if (index != null) {
      dashBoardKey.currentState?.setState(() {
        dashBoardKey.currentState?.cIndex = index;
      });
    }
    if (route.isNotEmpty) {
      Navigator.pushNamed(context, route);
    }
  }

  List<Widget> newsWidgets(List<News>? list) {
    // Tạo danh sách các widget từ danh sách tin tức
    return list!.map((news) {
      return NewsCard(news: news);
    }).toList();
  }

  CheckInHandle get _checkInHandle => Get.find<CheckInHandle>();

  HomeHandle get _homeHandle => Get.find<HomeHandle>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            hideSnackBar();
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    AspectRatio(
                      aspectRatio: 1000 / 417,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: MySizes.size10SW,
                          vertical: MySizes.size20SW,
                        ),
                        alignment: Alignment.topRight,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(Images.banner),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MySizes.size50SW,
                              child: Image.asset(
                                Images.logo,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              children: [
                                AvatarGlow(
                                  glowCount: 1,
                                  glowColor: MyColors.lightBlue,
                                  animate: false,
                                  duration: const Duration(seconds: 1),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/announcement_home');
                                    },
                                    child: Icon(
                                      MyIcons.notifications,
                                      color: MyColors.blue,
                                      size: MySizes.size26SW,
                                    ),
                                  ),
                                ),
                                SizedBox(width: MySizes.size15SW),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        MySizes.size20SW,
                        0,
                        MySizes.size20SW,
                        0,
                      ),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: Offset(0, -MySizes.size25SW),
                            child: Container(
                              padding: EdgeInsets.all(MySizes.size15SW),
                              decoration: BoxDecoration(
                                color: MyColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromRGBO(
                                        123, 174, 255, 0.5),
                                    blurRadius: MySizes.size2SW,
                                    spreadRadius: MySizes.size2SW,
                                    offset: Offset(
                                      MySizes.size1SW,
                                      MySizes.size1SW,
                                    ),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(
                                  MySizes.size15SW,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      accessPage('', 2);
                                    },
                                    child: const QuickAccessWidget(
                                      icon: Icons.groups_2,
                                      title: 'Nhóm lớp',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await _checkInHandle.handleCheckDevice();
                                    },
                                    child: const QuickAccessWidget(
                                      icon: FontAwesomeIcons.qrcode,
                                      title: 'Điểm danh',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      accessPage('', 3);
                                    },
                                    child: const QuickAccessWidget(
                                      icon: Icons.leaderboard,
                                      title: 'Cuộc thi',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              SizedBox(),
                              AspectRatio(
                                aspectRatio: 1.5 / 1,
                                child: CarouselSlider(
                                  items: _items,
                                  carouselController: carouselController,
                                  options: CarouselOptions(
                                    viewportFraction: 1.0,
                                    animateToClosest: true,
                                    pauseAutoPlayOnManualNavigate: true,
                                    pauseAutoPlayOnTouch: true,
                                    autoPlay: false,
                                    aspectRatio: 1.5 / 1,
                                    enlargeStrategy:
                                        CenterPageEnlargeStrategy.zoom,
                                    onScrolled: (value) {},
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _pageIndex = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: MySizes.size15SW,
                                left: (((size.width / 2) - MySizes.size20SW) -
                                    ((MySizes.size24SW * 5 + MySizes.size20SW) /
                                        2)),
                                child: SizedBox(
                                  height: MySizes.size5SW,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:
                                        _items.asMap().entries.map((entry) {
                                      return GestureDetector(
                                        onTap: () => carouselController
                                            .animateToPage(entry.key),
                                        child: Indicator(
                                            isSelected:
                                                entry.key == _pageIndex),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              // ),
                            ],
                          ),
                          SizedBox(height: MySizes.size10SW),
                          Obx(
                            () => _homeHandle.isFirstLoadRunning.value
                                ? LoadingHomePage()
                                : Column(
                                    children:
                                        newsWidgets(_homeHandle.newsLoadMore),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
