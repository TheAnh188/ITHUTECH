class LoginResponse {
  Token? token;
  UserInfo? userInfo;

  LoginResponse({this.token, this.userInfo});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    userInfo =
        json['user_info'] != null ? UserInfo.fromJson(json['user_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (token != null) {
      data['token'] = token!.toJson();
    }
    if (userInfo != null) {
      data['user_info'] = userInfo!.toJson();
    }
    return data;
  }
}

class Token {
  String? accessToken;
  String? refreshToken;

  Token({this.accessToken, this.refreshToken});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}

class UserInfo {
  int? id;
  String? username;
  String? email;
  String? nickname;
  String? className;
  int? isVerifyEmail;
  bool? isTeacher;
  bool? isAdmin;

  UserInfo(
      {this.id,
      this.username,
      this.email,
      this.nickname,
      this.className,
      this.isVerifyEmail,
      this.isTeacher,
      this.isAdmin});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    nickname = json['nickname'];
    className = json['class_name'];
    isVerifyEmail = json['is_verify_email'];
    isTeacher = json['is_teacher'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['nickname'] = nickname;
    data['class_name'] = className;
    data['is_verify_email'] = isVerifyEmail;
    data['is_teacher'] = isTeacher;
    data['is_admin'] = isAdmin;
    return data;
  }
}
