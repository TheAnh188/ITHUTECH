import 'package:get/get.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/members_page/api/members_dio.dart';
import 'package:hutech_check_in_app/pages/members_page/api/members_response.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class MembersHandle extends GetxController {
  MembersDio membersDio;

  MembersHandle({required this.membersDio});

  final members = <Member>[].obs;

  Future<bool> handleGetMembers(int groupId) async {
    var response = await membersDio.getMembers(groupId);
    members.clear();
    if (response.statusCode == 200) {
      if (response.data != null) {
        members.addAll(response.data!.member!);
      }
      return true;
    } else {
      SnackbarCustom.showError(
        message: response.message!,
        context: navigatorKey.currentContext!,
      );
      return false;
    }
  }
}
