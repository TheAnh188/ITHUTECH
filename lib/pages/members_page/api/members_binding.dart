import 'package:get/instance_manager.dart';
import 'package:hutech_check_in_app/pages/members_page/api/members_dio.dart';
import 'package:hutech_check_in_app/pages/members_page/api/members_handle.dart';

class MembersBinding extends Bindings {
  MembersDio membersDio = Get.find();

  @override
  void dependencies() {
    Get.put<MembersHandle>(MembersHandle(membersDio: membersDio));
  }
}
