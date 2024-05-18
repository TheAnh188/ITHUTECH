import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/pages/login_page/api/login_response.dart';

abstract class AuthApi {
  Future<BaseResponse<LoginResponse>> login(String username, String password);
  Future<BaseResponse<bool>> resetPassword(String email);
}

class AuthApiIpml implements AuthApi {
  DioApi dioApi;
  AuthApiIpml({required this.dioApi});

  @override
  Future<BaseResponse<LoginResponse>> login(
      String username, String password) async {
    var formData = FormData.fromMap({
      'username': username,
      'password': password,
    });
    return await dioApi.doPost<LoginResponse>(
      ApiPath.login,
      formData,
      parseJson: (json) => LoginResponse.fromJson(json),
    );
  }

  @override
  Future<BaseResponse<bool>> resetPassword(String email) async {
    var formData = FormData.fromMap({
      'email': email,
    });
    return await dioApi.doPost<bool>(
      ApiPath.resetPassword,
      formData,
    );
  }
}
