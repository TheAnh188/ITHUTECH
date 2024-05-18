// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/pages/contests_page/api/contests_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContestsDio {
  final _dio = Dio();

  Future<bool> getAllContests() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _dio.options.headers['Authorization'] =
        'Bearer ${pref.getString('accessToken')}';
    try {
      var response = await _dio.get(
        ApiPath.getAllContests,
      );
      ContestsResponse contestsResponse =
          ContestsResponse.fromJson(response.data);
      var jsonString = jsonEncode(contestsResponse);
      await pref.setString('contests', jsonString);
      return true;
    } on DioException catch (e) {
      print('Loi : $e');
    }
    return false;
  }
}
