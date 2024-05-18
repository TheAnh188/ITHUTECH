import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_response.dart';
import 'package:hutech_check_in_app/pages/check_in_page/api/check_in_result_response.dart';

abstract class CheckInDio {
  Future<BaseResponse<bool>> activateUserId(String deviceId, String deviceName);
  Future<BaseResponse<bool>> checkDevice(String deviceId);
  Future<BaseResponse<bool>> checkInByQR(
      String encryptedContent, String deviceId);
  Future<BaseResponse<CheckInResponse>> getCheckIn(int groupId);
  Future<BaseResponse<CheckInResultResponse>> getCheckInResult(int checkInID);
}

class CheckInDioIpml implements CheckInDio {
  DioApi dioApi;
  CheckInDioIpml({required this.dioApi});

  @override
  Future<BaseResponse<bool>> activateUserId(
      String deviceId, String deviceName) async {
    var formData = FormData.fromMap({
      'device_id': deviceId,
      'device_name': deviceName,
    });
    return await dioApi.doPost<bool>(
      ApiPath.activateUserId,
      formData,
    );
  }

  @override
  Future<BaseResponse<bool>> checkDevice(String deviceId) async {
    var formData = FormData.fromMap({
      'device_id': deviceId,
    });
    return await dioApi.doPost<bool>(
      ApiPath.checkDevice,
      formData,
    );
  }

  @override
  Future<BaseResponse<bool>> checkInByQR(
      String encryptedContent, String deviceId) async {
    var formData = FormData.fromMap({
      'encrypted_content': encryptedContent,
      'device_id': deviceId,
    });
    return await dioApi.doPost<bool>(
      ApiPath.checkInByQr,
      formData,
    );
  }

  @override
  Future<BaseResponse<CheckInResponse>> getCheckIn(int groupId) async {
    var formData = FormData.fromMap({
      'group_id': groupId,
    });
    return await dioApi.doPost<CheckInResponse>(
      ApiPath.getCheckIn,
      formData,
      parseJson: (json) => CheckInResponse.fromJson(json),
    );
  }

  @override
  Future<BaseResponse<CheckInResultResponse>> getCheckInResult(
      int checkInID) async {
    var formData = FormData.fromMap({
      'check_in_id': checkInID,
    });
    return await dioApi.doPost<CheckInResultResponse>(
      ApiPath.getCheckInResults,
      formData,
      parseJson: (json) => CheckInResultResponse.fromJson(json),
    );
  }

  // Future<bool> getCheckInResult(int checkInID) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   _dio.options.headers['Authorization'] =
  //       'Bearer ${pref.getString('accessToken')}';
  //   try {
  //     var formData = FormData.fromMap({
  //       'check_in_id': checkInID,
  //     });

  //     var response = await _dio.post(
  //       ApiPath.getCheckInResults,
  //       data: formData,
  //     );
  //     CheckInResultResponse result =
  //         CheckInResultResponse.fromJson(response.data);
  //     var jsonString = jsonEncode(result);
  //     await pref.setString('result', jsonString);
  //     return true;
  //   } on DioException catch (e) {
  //     print('Loi : $e');
  //   }
  //   return false;
  // }
}
