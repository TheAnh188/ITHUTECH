import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/group_user_response.dart';
import 'package:hutech_check_in_app/pages/groups_page/api/groups_response.dart';

abstract class GroupsDio {
  Future<BaseResponse<GroupsResponse>> getAllGroups();
  Future<BaseResponse<GroupUserResponse>> getUserGroup(int groupId);
}

class GroupsDioIpml implements GroupsDio {
  DioApi dioApi;
  GroupsDioIpml({required this.dioApi});

  @override
  Future<BaseResponse<GroupsResponse>> getAllGroups() async {
    return await dioApi.doGet<GroupsResponse>(
      ApiPath.getAllGroups,
      parseJson: (json) => GroupsResponse.fromJson(json),
    );
  }

  @override
  Future<BaseResponse<GroupUserResponse>> getUserGroup(int groupId) async {
    var formData = FormData.fromMap({
      'group_id': groupId,
    });
    return await dioApi.doPost<GroupUserResponse>(
      ApiPath.getGroupUser,
      formData,
      parseJson: (json) => GroupUserResponse.fromJson(json),
    );
  }
}
