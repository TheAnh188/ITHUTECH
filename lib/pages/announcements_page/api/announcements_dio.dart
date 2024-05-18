// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/pages/announcements_page/api/announcements_response.dart';

abstract class AnnouncementsDio {
  Future<BaseResponse<AnnouncementResponse>> getAnnouncements(int groupId);
}

class AnnouncementsDioIpml implements AnnouncementsDio {
  DioApi dioApi;
  AnnouncementsDioIpml({required this.dioApi});
  @override
  Future<BaseResponse<AnnouncementResponse>> getAnnouncements(
      int entityId) async {
    var formData = FormData.fromMap({
      'entity_id': entityId,
    });
    return await dioApi.doPost<AnnouncementResponse>(
      ApiPath.getAnnouncements,
      formData,
      parseJson: (json) => AnnouncementResponse.fromJson(json),
    );
  }
}
