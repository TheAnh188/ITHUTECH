class AnnouncementResponse {
  List<Announcement>? announcement;

  AnnouncementResponse({this.announcement});

  AnnouncementResponse.fromJson(Map<String, dynamic> json) {
    if (json['announcement'] != null) {
      announcement = <Announcement>[];
      json['announcement'].forEach((v) {
        announcement!.add(Announcement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (announcement != null) {
      data['announcement'] = announcement!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Announcement {
  int? id;
  String? nickname;
  String? title;
  String? createdAt;
  String? specificDay;

  Announcement(
      {this.id, this.nickname, this.title, this.createdAt, this.specificDay});

  Announcement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    title = json['title'];
    createdAt = json['created_at'];
    specificDay = json['specific_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nickname'] = nickname;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['specific_day'] = specificDay;
    return data;
  }
}
