// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:hutech_check_in_app/animation/loading_dialog.dart';
// import 'package:hutech_check_in_app/data/assignment.dart';
// import 'package:hutech_check_in_app/pages/contests_page/api/contests_response.dart';
// import 'package:hutech_check_in_app/pages/loading_page/loading_contest_page.dart';
// import 'package:hutech_check_in_app/pages/standing_page/api/standing_response.dart';
// import 'package:hutech_check_in_app/utils/icons.dart';
// import 'package:hutech_check_in_app/utils/style.dart';
// import 'package:hutech_check_in_app/widgets/assignment_list_tile.dart';
// import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
// import 'package:hutech_check_in_app/widgets/category.dart';
// import 'package:hutech_check_in_app/widgets/ranking_list_tile.dart';
// import 'package:hutech_check_in_app/widgets/ranking_widget.dart';

// class DetailContestPage extends StatefulWidget {
//   const DetailContestPage({super.key});

//   @override
//   State<DetailContestPage> createState() => _DetailContestPageState();
// }

// class _DetailContestPageState extends State<DetailContestPage> {
//   final List _categories = ['Bài tập', 'Bảng kết quả'];
//   final List _icons = [MyIcons.assignment, MyIcons.rank];
//   int _selectedCategory = 0;
//   late bool _loading;
//   late Timer _loadingTimer;
//   late bool _isDisposed;

//   @override
//   void initState() {
//     _isDisposed = false;
//     _loading = true;
//     _loadingg();
//     super.initState();
//   }

//   void _loadingg() {
//     _loadingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _loading = false;
//       });
//       timer.cancel();
//     });
//   }

//   @override
//   void dispose() {
//     _loadingTimer.cancel();
//     _isDisposed = true;
//     super.dispose();
//   }

//   List<Widget> assignmentWidgets(
//     List<Assignment> list,
//   ) {
//     return list.map((index) {
//       return AssignmentListTile(
//         assignment: index,
//       );
//     }).toList();
//   }

//   Future<void> _refresh() {
//     return Future.delayed(const Duration(seconds: 1), () {
//       if (!_isDisposed && _selectedCategory == 0) {
//         setState(() {
//           _loading = true;
//         });
//         _loadingg();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Contest dataProvider =
//         ModalRoute.of(context)?.settings.arguments as Contest;
//     return Scaffold(
//       body: SafeArea(
//         child: RefreshIndicator(
//           edgeOffset: MySizes.size50SW,
//           triggerMode: RefreshIndicatorTriggerMode.anywhere,
//           displacement: MySizes.size50SW,
//           strokeWidth: MySizes.size2SW,
//           backgroundColor: MyColors.blue,
//           color: MyColors.white,
//           onRefresh: _refresh,
//           child: CustomScrollView(
//             physics: _loading
//                 ? const NeverScrollableScrollPhysics()
//                 : const BouncingScrollPhysics(),
//             slivers: [
//               SliverAppBar(
//                 centerTitle: true,
//                 floating: true,
//                 pinned: false,
//                 snap: false,
//                 scrolledUnderElevation: 0,
//                 toolbarHeight: MySizes.size85SW,
//                 leadingWidth: MySizes.size65SW,
//                 backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//                 leading: const BackArrowButton(),
//               ),
//               SliverList(
//                 delegate: SliverChildListDelegate(
//                   [
//                     _loading
//                         ? const LoadingContestPage()
//                         : Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: MySizes.size25SW),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${dataProvider.title}',
//                                   style: MyTextStyles.content20MediumBlueSW,
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 2,
//                                 ),
//                                 SizedBox(height: MySizes.size15SW),
//                                 SizedBox(
//                                   height: MySizes.size45SW,
//                                   child: ListView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     itemCount: _categories.length,
//                                     itemBuilder: (context, index) =>
//                                         GestureDetector(
//                                       onTap: () async {
//                                         await loading();
//                                         await dissmis();
//                                         setState(() {
//                                           _selectedCategory = index;
//                                         });
//                                       },
//                                       child: Category(
//                                         title: _categories[index],
//                                         icon: _icons[index],
//                                         isSelected: index == _selectedCategory,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                     SizedBox(height: MySizes.size15SW),
//                     _selectedCategory == 0
//                         ? Column(
//                             children:
//                                 assignmentWidgets(AssignmentList().generate()),
//                           )
//                         : Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   RankingWidget(
//                                     height: MySizes.size130SW,
//                                     path: 'assets/images/silver-medal.png',
//                                     standing: new Standing(),
//                                     ranking: 2,
//                                     color: MyColors.lightBlueAccent,
//                                     style: MyTextStyles.content90BoldWhiteSW,
//                                   ),
//                                   RankingWidget(
//                                     height: MySizes.size160SW,
//                                     path: 'assets/images/gold-medal.png',
//                                     standing: new Standing(),
//                                     ranking: 1,
//                                     color: MyColors.lightBlue,
//                                     style: MyTextStyles.content100BoldWhiteSW,
//                                   ),
//                                   RankingWidget(
//                                     height: MySizes.size110SW,
//                                     path: 'assets/images/bronze-medal.png',
//                                     standing: new Standing(),
//                                     ranking: 3,
//                                     color: MyColors.lightBlueAccent,
//                                     style: MyTextStyles.content80BoldWhiteSW,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: MySizes.size20SW),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: MySizes.size5SW),
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: MySizes.size20SW),
//                                   decoration: BoxDecoration(
//                                     color: MyColors.lightBlue.withOpacity(.2),
//                                     borderRadius:
//                                         BorderRadius.circular(MySizes.size18SW),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       RankingListTile(
//                                           standing: new Standing(), ranking: 4),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(height: MySizes.size20SW),
//                             ],
//                           ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
