import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/pages/members_page/api/members_response.dart';

abstract class MembersDio {
  Future<BaseResponse<MembersResponse>> getMembers(int groupId);
}

class MembersDioIpml implements MembersDio {
  DioApi dioApi;
  MembersDioIpml({required this.dioApi});
  @override
  Future<BaseResponse<MembersResponse>> getMembers(int groupId) async {
    var formData = FormData.fromMap({
      'group_id': groupId,
    });
    return await dioApi.doPost<MembersResponse>(
      ApiPath.getMembers,
      formData,
      parseJson: (json) => MembersResponse.fromJson(json),
    );
  }
}
