import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/coming_soon.dart';

class DetailAssignmentPage extends StatefulWidget {
  const DetailAssignmentPage({super.key});

  @override
  State<DetailAssignmentPage> createState() => _DetailAssignmentPageState();
}

class _DetailAssignmentPageState extends State<DetailAssignmentPage> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(isCanBack: true, message: 'Chi tiết bài tập sẽ sớm được mở',);
  }
}


// import 'package:flutter/material.dart';
// import 'package:hutech_check_in_app/pages/assignments_page/api/problems_response.dart';
// import 'package:hutech_check_in_app/pages/login_page/api/login_handle.dart';
// import 'package:hutech_check_in_app/utils/style.dart';
// import 'package:hutech_check_in_app/widgets/back_arrow_button.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class DetailAssignmentPage extends StatefulWidget {
//   const DetailAssignmentPage({super.key});

//   @override
//   State<DetailAssignmentPage> createState() => _DetailAssignmentPageState();
// }

// class _DetailAssignmentPageState extends State<DetailAssignmentPage> {
//   late LoginHandle _loginHandle;
//   late Future<bool> _checkExpiredToken;

//   @override
//   void initState() {
//     super.initState();
//     _loginHandle = LoginHandle();
//     _checkExpiredToken = _loginHandle.handleCheckExpiredToken();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _loginHandle = Provider.of<LoginHandle>(context);
//     Problems problem = ModalRoute.of(context)?.settings.arguments as Problems;
//     return FutureBuilder<Object>(
//         future: _checkExpiredToken,
//         builder: (context, snapshot) {
//           if (snapshot.data == true) {
//             return Scaffold(
//               body: SafeArea(
//                 child: Stack(
//                   children: [
//                     CustomScrollView(
//                       physics: const AlwaysScrollableScrollPhysics(
//                         parent: BouncingScrollPhysics(),
//                       ),
//                       slivers: [
//                         SliverAppBar(
//                           centerTitle: true,
//                           title: Text(
//                             'Bài tập',
//                             style: MyTextStyles.content25MediumBlackSW,
//                           ),
//                           floating: true,
//                           pinned: false,
//                           snap: false,
//                           scrolledUnderElevation: 0,
//                           toolbarHeight: MySizes.size85SW,
//                           leadingWidth: MySizes.size65SW,
//                           backgroundColor:
//                               Theme.of(context).scaffoldBackgroundColor,
//                           leading: const BackArrowButton(),
//                         ),
//                         SliverList(
//                           delegate: SliverChildListDelegate(
//                             [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: MySizes.size25SW),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '${problem.title}',
//                                       style: MyTextStyles.content22MediumBlueSW,
//                                     ),
//                                     SizedBox(height: MySizes.size10SW),
//                                     Text(
//                                       'Mô tả yêu cầu',
//                                       style:
//                                           MyTextStyles.content22MediumBlackSW,
//                                     ),
//                                     SizedBox(height: MySizes.size10SW),
//                                     Text(
//                                       Bidi.stripHtmlIfNeeded(
//                                           problem.description ?? ''),
//                                       // problem.description ?? '',
//                                       style:
//                                           MyTextStyles.content17RegularBlackSW,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Positioned.fill(
//                       bottom: MySizes.size50SW,
//                       child: Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           margin: EdgeInsets.symmetric(
//                               horizontal: MySizes.size30SW),
//                           height: MySizes.size50SW,
//                           decoration: BoxDecoration(
//                             color: MyColors.blue,
//                             borderRadius:
//                                 BorderRadius.circular(MySizes.size25SW),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'Chưa hoàn thành',
//                               style: MyTextStyles.content20MediumWhiteSW,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//           return Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               title: Text(
//                 'Bài tập',
//                 style: MyTextStyles.content25MediumBlackSW,
//               ),
//               scrolledUnderElevation: 0,
//               toolbarHeight: MySizes.size85SW,
//               leadingWidth: MySizes.size65SW,
//               backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//               leading: const BackArrowButton(),
//             ),
//           );
//         });
//   }
// }
