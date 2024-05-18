import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';

abstract class SplashDio {
  Future<BaseResponse<bool>> getNickName();
}

class SplashDioIpml implements SplashDio {
  DioApi dioApi;
  SplashDioIpml({required this.dioApi});

  @override
  Future<BaseResponse<bool>> getNickName() async {
    return await dioApi.doGet<bool>(
      ApiPath.getNickname,
    );
  }
}
