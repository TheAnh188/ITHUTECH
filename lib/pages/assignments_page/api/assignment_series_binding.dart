import 'package:get/instance_manager.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignments_dio.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignments_handle.dart';

class AssignmentSeriesBinding extends Bindings {
  AssignmentsDio assignmentsDio = Get.find();

  @override
  void dependencies() {
    Get.put<AssignmentsHandle>(
        AssignmentsHandle(assignmentsDio: assignmentsDio));
  }
}
