import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> loading({String status = "Đang tải"}) async {
  await EasyLoading.show(
    status: status,
  );
}

// Future<void> showToast(String status) async {
//   await EasyLoading.showToast(
//     status,
//     dismissOnTap: false,
//     maskType: EasyLoadingMaskType.clear,
//     toastPosition: EasyLoadingToastPosition.bottom,
//     duration: const Duration(milliseconds: 800),
//   );
// }

Future<void> dissmis() async {
  await EasyLoading.dismiss();
}

// Future<void> showErrorDialog(String status, String? tooltip) async {
//   await AwesomeDialog(
//     isDense: true,
//     body: SizedBox(
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         textBaseline: TextBaseline.alphabetic,
//         children: [
//           Text(
//             status,
//             style: MyTextStyles.content20MediumBlackSW,
//           ),
//           tooltip != null
//               ? Tooltip(
//                   decoration: BoxDecoration(
//                     color: MyColors.orange,
//                     borderRadius: BorderRadius.circular(
//                       MySizes.size5SW,
//                     ),
//                   ),
//                   textAlign: TextAlign.center,
//                   textStyle: MyTextStyles.content15MediumWhiteSW,
//                   showDuration: const Duration(milliseconds: 500),
//                   preferBelow: false,
//                   triggerMode: TooltipTriggerMode.tap,
//                   message: tooltip,
//                   child: Icon(
//                     MyIcons.info,
//                     color: MyColors.orange,
//                     size: MySizes.size20SW,
//                   ),
//                 )
//               : const SizedBox(),
//         ],
//       ),
//     ),
//     
//     headerAnimationLoop: false,
//     bodyHeaderDistance: 0,
//     dialogType: DialogType.noHeader,
//     padding: EdgeInsets.symmetric(
//         horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
//     btnCancel: GestureDetector(
//       onTap: () {
//         Navigator.pop(navigatorKey.currentContext!);
//       },
//       child: Container(
//         padding: EdgeInsets.all(MySizes.size5SW),
//         decoration: BoxDecoration(
//             color: MyColors.red,
//             borderRadius: BorderRadius.circular(MySizes.size25SW)),
//         child: Center(
//           child: Text(
//             'OK',
//             style: MyTextStyles.content20BoldWhiteSW,
//           ),
//         ),
//       ),
//     ),
//   ).show();
// }

// Future<void> showOptionDialog(
//     String status, String tooltip, Function() function) async {
//   await AwesomeDialog(
//     isDense: true,
//     reverseBtnOrder: true,
//     body: SizedBox(
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         textBaseline: TextBaseline.alphabetic,
//         children: [
//           Text(
//             status,
//             style: MyTextStyles.content20MediumBlackSW,
//           ),
//           Tooltip(
//             decoration: BoxDecoration(
//               color: MyColors.orange,
//               borderRadius: BorderRadius.circular(
//                 MySizes.size5SW,
//               ),
//             ),
//             textAlign: TextAlign.center,
//             textStyle: MyTextStyles.content15MediumWhiteSW,
//             showDuration: const Duration(milliseconds: 500),
//             preferBelow: false,
//             triggerMode: TooltipTriggerMode.tap,
//             message: tooltip,
//             child: Icon(
//               MyIcons.info,
//               color: MyColors.orange,
//               size: MySizes.size20SW,
//             ),
//           )
//         ],
//       ),
//     ),
//     
//     headerAnimationLoop: false,
//     bodyHeaderDistance: 0,
//     dialogType: DialogType.noHeader,
//     padding: EdgeInsets.symmetric(
//         horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
//     btnCancel: GestureDetector(
//       onTap: () {
//         Navigator.pop(navigatorKey.currentContext!);
//       },
//       child: Container(
//         padding: EdgeInsets.all(MySizes.size5SW),
//         decoration: BoxDecoration(
//             color: MyColors.red,
//             borderRadius: BorderRadius.circular(MySizes.size25SW)),
//         child: Center(
//           child: Text(
//             'Không',
//             style: MyTextStyles.content20BoldWhiteSW,
//           ),
//         ),
//       ),
//     ),
//     btnOk: GestureDetector(
//       onTap: function,
//       child: Container(
//         padding: EdgeInsets.all(MySizes.size5SW),
//         decoration: BoxDecoration(
//             color: const Color(0xFF00CA71),
//             borderRadius: BorderRadius.circular(MySizes.size25SW)),
//         child: Center(
//           child: Text(
//             'Có',
//             style: MyTextStyles.content20BoldWhiteSW,
//           ),
//         ),
//       ),
//     ),
//   ).show();
// }

// Future<void> showSuccessDialog(String? status) async {
//   await AwesomeDialog(
//     isDense: true,
//     body: SizedBox(
//       child: Text(
//         status ?? 'Cập nhật thành công',
//         style: MyTextStyles.content20MediumBlackSW,
//       ),
//     ),
//     
//     headerAnimationLoop: false,
//     bodyHeaderDistance: 0,
//     dialogType: DialogType.noHeader,
//     padding: EdgeInsets.symmetric(
//         horizontal: MySizes.size20SW, vertical: MySizes.size10SW),
//     btnOk: GestureDetector(
//       onTap: () {
//         Navigator.pop(navigatorKey.currentContext!);
//       },
//       child: Container(
//         padding: EdgeInsets.all(MySizes.size5SW),
//         decoration: BoxDecoration(
//             color: const Color(0xFF00CA71),
//             borderRadius: BorderRadius.circular(MySizes.size25SW)),
//         child: Center(
//           child: Text(
//             'OK',
//             style: MyTextStyles.content20BoldWhiteSW,
//           ),
//         ),
//       ),
//     ),
//   ).show();
// }
