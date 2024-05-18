import 'package:get/get.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/group_user_response.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_dio.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class GroupsHandle extends GetxController {
  GroupsDio groupsDio;

  GroupsHandle({required this.groupsDio});
  final groupUser = <GroupUser>[].obs;
  final enrolledGroups = <Group>[].obs;
  final archivedGroups = <Group>[].obs;

  Future<bool> handleGetAllGroups() async {
    var response = await groupsDio.getAllGroups();
    if (response.statusCode == 200) {
      enrolledGroups.clear();
      archivedGroups.clear();
      if (response.data != null) {
        enrolledGroups.addAll(
            response.data!.group!.where((status) => status.status != 3));
        archivedGroups.addAll(
            response.data!.group!.where((status) => status.status == 3));
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

  Future<bool> handleGetUserGroup(int groupId) async {
    var response = await groupsDio.getUserGroup(groupId);
    groupUser.clear();
    if (response.statusCode == 200) {
      groupUser.addAll(response.data!.groupUser ?? []);
      return true;
    } else {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: response.message!,
      );
      return false;
    }
  }
}
