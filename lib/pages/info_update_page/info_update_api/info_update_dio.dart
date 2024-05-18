import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';

abstract class InfoUpdateDio {
  Future<BaseResponse<bool>> changePassword(String newPassword);
  Future<BaseResponse<bool>> changeEmail(String newEmail);
  Future<BaseResponse<bool>> verifyEmail();
  Future<BaseResponse<bool>> changePhoneNumber(String newPhoneNumber);
}

class InfoUpdateDioIpml implements InfoUpdateDio {
  DioApi dioApi;
  InfoUpdateDioIpml({required this.dioApi});

  @override
  Future<BaseResponse<bool>> changePassword(String newPassword) async {
    var formData = FormData.fromMap({
      'password': newPassword,
    });
    return await dioApi.doPost<bool>(
      ApiPath.changePassword,
      formData,
    );
  }

  @override
  Future<BaseResponse<bool>> changeEmail(String newEmail) async {
    var formData = FormData.fromMap({
      'email': newEmail,
    });
    return await dioApi.doPost<bool>(
      ApiPath.changeEmail,
      formData,
    );
  }

  @override
  Future<BaseResponse<bool>> verifyEmail() async {
    return await dioApi.doGet<bool>(
      ApiPath.verifyEmail,
    );
  }

  @override
  Future<BaseResponse<bool>> changePhoneNumber(String newPhoneNumber) async {
    var formData = FormData.fromMap({
      'phone_number': newPhoneNumber,
    });
    return await dioApi.doPost<bool>(
      ApiPath.changePhoneNumber,
      formData,
    );
  }
}
