import 'dart:core';

class BaseResponse<T> {
  int? statusCode;
  String? message;
  T? data;

  BaseResponse.fromJson(Map<String, dynamic> json,
      {T Function(dynamic json)? parseJson}) {
    statusCode = json["statusCode"] ?? 401;
    data = json['data'] != null ? parseJson?.call(json['data']) : null;
    message = json['message'];
  }

  BaseResponse.initError(int code, String mess) {
    statusCode = code;
    message = mess;
    data = null;
  }
}
