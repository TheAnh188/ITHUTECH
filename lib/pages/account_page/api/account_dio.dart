import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/pages/account_page/api/account_response.dart';

abstract class AccountDio {
  Future<BaseResponse<AccountResponse>> getUserInfo();
}

class AccountDioIpml implements AccountDio {
  DioApi dioApi;
  AccountDioIpml({required this.dioApi});

  @override
  Future<BaseResponse<AccountResponse>> getUserInfo() async {
    return await dioApi.doGet<AccountResponse>(
      ApiPath.getInfoUser,
      parseJson: (json) => AccountResponse.fromJson(json),
    );
  }

  // Future<bool> getUserInfo() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   _dio.options.headers['Authorization'] =
  //       'Bearer ${pref.getString('accessToken')}';
  //   try {
  //     var response = await _dio.get(
  //       ApiPath.getInfoUser,
  //     );
  //     AccountResponse accountResponse = AccountResponse.fromJson(response.data);
  //     var jsonString = jsonEncode(accountResponse);
  //     await pref.setString('infoUser', jsonString);
  //     return true;
  //   } on DioException catch (e) {
  //     print('Loi : $e');
  //   }
  //   return false;
  // }
}
