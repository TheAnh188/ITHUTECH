import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/coming_soon.dart';

class AnnouncementsHomePage extends StatefulWidget {
  const AnnouncementsHomePage({super.key});

  @override
  State<AnnouncementsHomePage> createState() => _AnnouncementsHomePageState();
}

class _AnnouncementsHomePageState extends State<AnnouncementsHomePage> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(
      message: 'Thông báo sẽ sớm được mở',
      isCanBack: true,
    );
  }
}


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:hutech_check_in_app/animation/loading_dialog.dart';
// import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_handle.dart';
// import 'package:hutech_check_in_app/pages/login_page/api/login_handle.dart';
// import 'package:hutech_check_in_app/utils/style.dart';
// import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
// import 'package:hutech_check_in_app/widgets/notification_list_tile.dart';
// import 'package:provider/provider.dart';

// class AnnouncementsHomePage extends StatefulWidget {
//   const AnnouncementsHomePage({super.key});

//   @override
//   State<AnnouncementsHomePage> createState() => _AnnouncementsHomePageState();
// }

// class _AnnouncementsHomePageState extends State<AnnouncementsHomePage> {
//   late AnnouncementsHandle _announcementsHandle;
//   late LoginHandle _loginHandle;
//   late Future<bool> _checkExpiredToken;

//   @override
//   void initState() {
//     super.initState();
//     _announcementsHandle = AnnouncementsHandle();
//     _loginHandle = LoginHandle();
//     _checkExpiredToken = _loginHandle.handleCheckExpiredToken();
//   }

//   void _loadinggg() async {
//     await loading();
//   }

//   void _dissmis() async {
//     await dissmis();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _loginHandle = Provider.of<LoginHandle>(context);
//     _announcementsHandle = Provider.of<AnnouncementsHandle>(context);
//     return FutureBuilder<Object>(
//       future: _checkExpiredToken,
//       builder: (context, snapshot) {
//         if (snapshot.data == true) {
//           return FutureBuilder<Object>(
//               future: _announcementsHandle.handleGetAnnouncements(214),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   _dissmis();
//                   return Scaffold(
//                     body: SafeArea(
//                       child: CustomScrollView(
//                         physics: const BouncingScrollPhysics(),
//                         slivers: [
//                           SliverAppBar(
//                             title: Text(
//                               'Thông Báo',
//                               style: MyTextStyles.content25MediumBlackSW,
//                             ),
//                             centerTitle: true,
//                             floating: true,
//                             pinned: false,
//                             snap: false,
//                             scrolledUnderElevation: 0,
//                             toolbarHeight: MySizes.size85SW,
//                             leadingWidth: MySizes.size65SW,
//                             backgroundColor:
//                                 Theme.of(context).scaffoldBackgroundColor,
//                             leading: const BackArrowButton(),
//                           ),
//                           SliverList(
//                             delegate: SliverChildListDelegate([
//                               ListView.builder(
//                                 physics: const BouncingScrollPhysics(),
//                                 shrinkWrap: true,
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: _announcementsHandle
//                                     .getAnnouncementsData()!
//                                     .length,
//                                 itemBuilder: (context, index) {
//                                   return GestureDetector(
//                                     onTap: () async {},
//                                     child: NotificationListTile(
//                                       announcement: _announcementsHandle
//                                           .getAnnouncementsData()![index],
//                                       index: false,
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ]),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//                 return const Scaffold();
//               });
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           _loadinggg();
//         }
//         return const Scaffold();
//       },
//     );
//   }
// }
