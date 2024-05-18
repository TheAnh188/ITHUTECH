import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hutech_check_in_app/core/base_response_api_model.dart';
import 'package:hutech_check_in_app/core/local_storage.dart';
import 'package:hutech_check_in_app/route/router.dart';
import 'package:hutech_check_in_app/utils/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class Api {
  String baseApiUrl = Get.find<AppEnvironment>().apiBaseUrl;
  LocalStorage authRepo;
  Api(this.authRepo);
  final String _checkHost = 'google.com';

  // Hàm lấy header cho các request
  Future<Map<String, String>> getHeader() async {
    Map<String, String> header = {
      "accept": "application/json",
      "content-type": "application/json"
    };

    var token = await authRepo.getAccessToken();
    if (token != null) {
      header.addAll({"Authorization": "Bearer $token"});
    }
    return header;
  }

  Future<BaseResponse<T>> doGet<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    T Function(dynamic json)? parseJson,
  });

  Future<BaseResponse<T>> doPost<T>(
    String url,
    dynamic body, {
    T Function(dynamic json)? parseJson,
  });

  Future<BaseResponse<T>> doPut<T>(
    String url,
    dynamic body, {
    T Function(dynamic json)? parseJson,
  });

  Future<BaseResponse<T>> doDelete<T>(
    String url, {
    T Function(dynamic json)? parseJson,
  });

  Future<BaseResponse<T>> handleResponse<T>(response);
  Future<BaseResponse<T>> handleInternalError<T>(error);

  // Xử lý khi gặp lỗi 401 (Unauthorized)
  Future<void> handleUnAuthorized() async {
    authRepo.handleUnAuthorized();
    if (Get.currentRoute != Routes.LOGIN) {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  // Kiểm tra kết nối internet
  Future<bool> checkBadInternet() async {
    try {
      if (GetPlatform.isWeb) {
        return false;
      }
      final result = await InternetAddress.lookup(_checkHost);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return false;
      }
    } on SocketException catch (_) {
      return true;
    }
    return true;
  }
}

class DioApi extends Api {
  Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
  ));

  DioApi({required LocalStorage localRepo}) : super(localRepo) {
    // Thêm interceptor để log request và response trong chế độ debug
    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
    }
  }

  // Xử lý phản hồi từ Dio
  Future<BaseResponse<T>> handleDioResponse<T>(response,
      {T Function(dynamic json)? parseJson}) async {
    try {
      if (response.statusCode! >= 200 && response.statusCode! <= 499) {
        // if (response.statusCode == 401) {
        //   await handleUnAuthorized();
        //   var error = BaseResponse<T>.initError(
        //       response.statusCode!, 'Phiên đăng nhập hết hạn');
        //   return error;
        // }
        var result =
            BaseResponse<T>.fromJson(response.data, parseJson: parseJson);
        return result;
      } else {
        var error = BaseResponse<T>.initError(
            response.statusCode!, 'Lỗi không xác định');
        return error;
      }
    } catch (error) {
      return handleInternalError<T>(error);
    }
  }

  @override
  Future<BaseResponse<T>> handleInternalError<T>(error) async {
    if (error is DioException) {
      return await handleDioError<T>(error);
    }
    if (error is TimeoutException) {
      return BaseResponse<T>.initError(-9999, 'Lỗi thời gian gửi yêu cầu');
    }
    if (error is SocketException) {
      if (error.osError != null) {
        if (error.osError?.errorCode == 8) {
          return BaseResponse<T>.initError(
              error.osError?.errorCode ?? -999, "Không có kết nối Internet");
        } else {
          return BaseResponse<T>.initError(
              error.osError?.errorCode ?? -999, error.osError!.message);
        }
      } else {
        return BaseResponse<T>.initError(
            error.osError?.errorCode ?? -999, "Không có kết nối Internet");
      }
    }
    if (error is NoSuchMethodError) {
      return BaseResponse<T>.initError(-1, "Lỗi khi truy xuất dữ liệu");
    }
    if (error is TypeError) {
      return BaseResponse<T>.initError(-2, "Lỗi chuyển đổi dữ liệu");
    }

    return BaseResponse.initError(-999, error?.message ?? 'altMessage'.tr);
  }

  @override
  Future<BaseResponse<T>> handleResponse<T>(response,
      {T Function(dynamic json)? parseJson}) async {
    if (response.statusCode == 200) {
      return await handleDioResponse<T>(response, parseJson: parseJson);
    } else {
      return await handleInternalError(response);
    }
  }

  // Xử lý lỗi từ Dio
  Future<BaseResponse<T>> handleDioError<T>(DioException dioError) async {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return BaseResponse<T>.initError(
            -9999, 'Kết nối vượt quá thời gian quy định');
      case DioExceptionType.sendTimeout:
        return BaseResponse<T>.initError(-9999, 'Lỗi thời gian gửi yêu cầu');
      case DioExceptionType.receiveTimeout:
        return BaseResponse<T>.initError(-9999, 'Lỗi thời gian nhận phản hồi');
      case DioExceptionType.badResponse:
        if (dioError.response?.statusCode == 502) {
          return BaseResponse<T>.initError(
              502, 'Máy chủ bị lỗi. Vui lòng thử lại sau');
        }
        if (dioError.response?.statusCode == 401) {
          await handleUnAuthorized();
          var error = BaseResponse<T>.initError(401, 'Phiên đăng nhập hết hạn');
          return error;
        }
        var error = dioError.response!.data['message'].toString();
        var errorCode = dioError.response?.data['statusCode'] ?? -9999;
        // var errorMessage = 'Lỗi máy chủ: $error';
        // print("Có lỗi $error");
        return BaseResponse<T>.initError(errorCode, error);
      case DioExceptionType.cancel:
        return BaseResponse<T>.initError(-9999, 'Yêu cầu bị hủy bỏ');
      default:
        return BaseResponse<T>.initError(
          dioError.response?.statusCode ?? -9999,
          dioError.message!,
        );
    }
  }

  @override
  Future<BaseResponse<T>> doGet<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    T Function(dynamic json)? parseJson,
    bool needThrowError = false,
  }) async {
    try {
      if (await checkBadInternet()) {
        return BaseResponse<T>.initError(-999, 'Kết nối mạng không thành công');
      }
      var header = await getHeader();
      var response = await dio.get(baseApiUrl + url,
          options: Options(headers: header), queryParameters: queryParams);
      return await handleResponse<T>(response, parseJson: parseJson);
    } catch (e) {
      if (needThrowError) {
        rethrow;
      } else {
        return handleInternalError<T>(e);
      }
    }
  }

  @override
  Future<BaseResponse<T>> doPost<T>(String url, dynamic body,
      {bool needThrowError = false,
      T Function(dynamic json)? parseJson}) async {
    try {
      if (await checkBadInternet()) {
        return BaseResponse<T>.initError(-999, 'Kết nối mạng không thành công');
      }
      var header = await getHeader();
      var response = await dio.post(baseApiUrl + url,
          data: body, options: Options(headers: header));
      // print('api response $response');
      return handleResponse<T>(response, parseJson: parseJson);
    } catch (e) {
      if (needThrowError) {
        rethrow;
      } else {
        return handleInternalError<T>(e);
      }
    }
  }

  @override
  Future<BaseResponse<T>> doPut<T>(String url, dynamic body,
      {bool needThrowError = false,
      T Function(dynamic json)? parseJson}) async {
    try {
      if (await checkBadInternet()) {
        return BaseResponse<T>.initError(-999, 'Kết nối mạng không thành công');
      }
      var header = await getHeader();
      var response = await dio.put(baseApiUrl + url,
          options: Options(headers: header), data: body);
      return handleResponse<T>(response, parseJson: parseJson);
    } catch (e) {
      if (needThrowError) {
        rethrow;
      } else {
        return handleInternalError<T>(e);
      }
    }
  }

  @override
  Future<BaseResponse<T>> doDelete<T>(String url,
      {bool needThrowError = false,
      T Function(dynamic json)? parseJson}) async {
    try {
      if (await checkBadInternet()) {
        return BaseResponse<T>.initError(-999, 'Kết nối mạng không thành công');
      }
      var header = await getHeader();
      var response =
          await dio.delete(baseApiUrl + url, options: Options(headers: header));
      return handleResponse<T>(response, parseJson: parseJson);
    } catch (e) {
      if (needThrowError) {
        rethrow;
      } else {
        return handleInternalError<T>(e);
      }
    }
  }
}
