import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/assignment_series_response.dart';
import 'package:hutech_check_in_app/pages/assignments_page/api/problems_response.dart';

abstract class AssignmentsDio {
  Future<BaseResponse<AssignmentSeriesResponse>> getAssignmentSeries(
      int groupId);
  Future<BaseResponse<ProblemsResponse>> getProblems(int contestId);
}

class AssignmentsDioIpml implements AssignmentsDio {
  DioApi dioApi;
  AssignmentsDioIpml({required this.dioApi});

  @override
  Future<BaseResponse<AssignmentSeriesResponse>> getAssignmentSeries(
      int groupId) async {
    var formData = FormData.fromMap({
      'group_id': groupId,
    });
    return await dioApi.doPost<AssignmentSeriesResponse>(
      ApiPath.getAssignmentSeries,
      formData,
      parseJson: (json) => AssignmentSeriesResponse.fromJson(json),
    );
  }

  @override
  Future<BaseResponse<ProblemsResponse>> getProblems(int contestId) async {
    var formData = FormData.fromMap({
      'contest_id': contestId,
    });
    return await dioApi.doPost<ProblemsResponse>(
      ApiPath.getProblems,
      formData,
      parseJson: (json) => ProblemsResponse.fromJson(json),
    );
  }
}
