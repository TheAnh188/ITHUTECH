import 'package:get/get.dart';
import 'package:hutech_check_in_app/main.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignments_dio.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignment_series_response.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/problems_response.dart';
import 'package:hutech_check_in_app/widgets/snackbar.dart';

class AssignmentsHandle extends GetxController {
  AssignmentsDio assignmentsDio;

  AssignmentsHandle({required this.assignmentsDio});

  final assignmentSeries = <AssignmentSeries>[].obs;
  final problems = <Problems>[].obs;

  Future<bool> handleGetAssignmentSeries(int groupId) async {
    var response = await assignmentsDio.getAssignmentSeries(groupId);
    assignmentSeries.clear();
    if (response.statusCode == 200) {
      if (response.data != null) {
        assignmentSeries.addAll(response.data!.assignmentSeries!);
      }
      return true;
    } else {
      SnackbarCustom.showError(
        context: navigatorKey.currentContext!,
        message: response.message!,
      );
      return false;
    }
  }

  Future<bool> handleGetProblems(int contestId) async {
    var response = await assignmentsDio.getProblems(contestId);
    problems.clear();
    if (response.statusCode == 200) {
      if (response.data != null) {
        problems.addAll(response.data!.problems!);
      }
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
