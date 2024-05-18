class MembersResponse {
  List<Member>? member;

  MembersResponse({this.member});

  MembersResponse.fromJson(Map<String, dynamic> json) {
    if (json['member'] != null) {
      member = <Member>[];
      json['member'].forEach((v) {
        member!.add(Member.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Member {
  int? userId;
  String? nickname;

  Member({this.userId, this.nickname});

  Member.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['nickname'] = nickname;
    return data;
  }
}
