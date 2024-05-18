import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/pages/coming_soon.dart';

class ContestsPage extends StatefulWidget {
  const ContestsPage({super.key});

  @override
  State<ContestsPage> createState() => _ContestsPageState();
}

class _ContestsPageState extends State<ContestsPage> {
  @override
  Widget build(BuildContext context) {
    return const ComingSoonScreen(message: 'Cuộc thi học thuật sẽ sớm được mở',);
  }
}

// import 'package:flutter/material.dart';
// import 'package:hutech_check_in_app/animation/loading_dialog.dart';
// import 'package:hutech_check_in_app/pages/contests_page/api/contests_handle.dart';
// import 'package:hutech_check_in_app/pages/contests_page/api/contests_response.dart';
// import 'package:hutech_check_in_app/pages/login_page/api/login_handle.dart';
// import 'package:hutech_check_in_app/utils/style.dart';
// import 'package:hutech_check_in_app/widgets/contest_widget.dart';
// import 'package:provider/provider.dart';

// class ContestsPage extends StatefulWidget {
//   const ContestsPage({super.key});

//   @override
//   State<ContestsPage> createState() => _ContestsPageState();
// }

// class _ContestsPageState extends State<ContestsPage> {
//   late ContestsHandle _contestsHandle;
//   late LoginHandle _loginHandle;
//   late Future<bool> _checkExpiredToken;

//   @override
//   void initState() {
//     super.initState();
//     _contestsHandle = ContestsHandle();
//     _loginHandle = LoginHandle();
//     _checkExpiredToken = _loginHandle.handleCheckExpiredToken();
//   }

//   List<Widget> contestWidgets(
//     List<Contest>? list,
//   ) {
//     return list!.map((index) {
//       return ContestWidget(
//         contest: index,
//       );
//     }).toList();
//   }

//   void _loadinggg() async {
//     await loading();
//   }

//   void _dissmis() async {
//     await dissmis();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _contestsHandle = Provider.of<ContestsHandle>(context);
//     _loginHandle = Provider.of<LoginHandle>(context);

//     return FutureBuilder<Object>(
//         future: _checkExpiredToken,
//         builder: (context, snapshot) {
//           if (snapshot.data == true) {
//             return FutureBuilder<Object>(
//               future: _contestsHandle.handleGetAllContests(),
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
//                               'Cuộc Thi',
//                               style: MyTextStyles.content30MediumBlackSW,
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
//                           ),
//                           SliverList(
//                               delegate: SliverChildListDelegate(contestWidgets(
//                                   _contestsHandle.getContestsData()))),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//                 return appBar(context);
//               },
//             );
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             _loadinggg();
//           }
//           return appBar(context);
//         });
//   }
// }

// Widget appBar(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(
//         'Cuộc Thi',
//         style: MyTextStyles.content30MediumBlackSW,
//       ),
//       centerTitle: true,
//       scrolledUnderElevation: 0,
//       toolbarHeight: MySizes.size85SW,
//       leadingWidth: MySizes.size65SW,
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//     ),
//   );
// }
