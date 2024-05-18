class AccountResponse {
  int? id;
  String? username;
  String? email;
  String? nickname;
  String? className;
  String? phoneNumber;
  int? isVerifyEmail;

  AccountResponse(
      {this.id,
      this.username,
      this.email,
      this.nickname,
      this.className,
      this.phoneNumber,
      this.isVerifyEmail});

  AccountResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    nickname = json['nickname'];
    className = json['class_name'];
    phoneNumber = json['phone_number'];
    isVerifyEmail = json['is_verify_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['nickname'] = nickname;
    data['class_name'] = className;
    data['phone_number'] = phoneNumber;
    data['is_verify_email'] = isVerifyEmail;
    return data;
  }
}
