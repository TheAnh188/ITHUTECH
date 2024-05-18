// ignore_for_file: avoid_print

import 'package:hutech_check_in_app/core/api_path.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/dio_api.dart';
import 'package:hutech_check_in_app/pages/home_page/api/news_response.dart';

abstract class HomeDio {
  Future<BaseResponse<NewsResponse>> getAllNews(); 
}

class HomeDioImpl implements HomeDio {
  DioApi dioApi;
  HomeDioImpl({required this.dioApi});

  
  @override
  Future<BaseResponse<NewsResponse>> getAllNews() async {
    return await dioApi.doGet<NewsResponse>(
      ApiPath.getNews,
      parseJson: (json) => NewsResponse.fromJson(json),
    );
  }
}
