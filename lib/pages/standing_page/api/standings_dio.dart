import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/pages/standing_page/api/standings_response.dart';

abstract class StandingsDio {
  Future<BaseResponse<StandingsResponse>> getStandings(int contestId);
}

class StandingsDioIpml implements StandingsDio {
  DioApi dioApi;
  StandingsDioIpml({required this.dioApi});

  @override
  Future<BaseResponse<StandingsResponse>> getStandings(int contestId) async {
    var formData = FormData.fromMap({
      'contest_id': contestId,
    });
    return await dioApi.doPost<StandingsResponse>(
      ApiPath.getStandings,
      formData,
      parseJson: (json) => StandingsResponse.fromJson(json),
    );
  }

  // Future<bool> getStanding(int contestId) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   _dio.options.headers['Authorization'] =
  //       'Bearer ${pref.getString('accessToken')}';
  //   try {
  //     var formData = FormData.fromMap({
  //       'contest_id': contestId,
  //     });

  //     var response = await _dio.post(
  //       ApiPath.getStanding,
  //       data: formData,
  //     );
  //     StandingResponse standingResponse =
  //         StandingResponse.fromJson(response.data);
  //     var jsonString = jsonEncode(standingResponse);
  //     await pref.setString('standing', jsonString);
  //     return true;
  //   } on DioException catch (e) {
  //     print('Loi : $e');
  //   }
  //   return false;
  // }
}
