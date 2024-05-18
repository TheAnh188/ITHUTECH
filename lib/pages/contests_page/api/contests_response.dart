class ContestsResponse {
  String? message;
  Data? data;

  ContestsResponse({this.message, this.data});

  ContestsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Contest>? contest;

  Data({this.contest});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['contest'] != null) {
      contest = <Contest>[];
      json['contest'].forEach((v) {
        contest!.add(Contest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (contest != null) {
      data['contest'] = contest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contest {
  int? contestId;
  String? title;
  int? userCount;
  int? isEnrolled;

  Contest({this.contestId, this.title, this.userCount, this.isEnrolled});

  Contest.fromJson(Map<String, dynamic> json) {
    contestId = json['contest_id'];
    title = json['title'];
    userCount = json['user_count'];
    isEnrolled = json['is_enrolled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contest_id'] = contestId;
    data['title'] = title;
    data['user_count'] = userCount;
    data['is_enrolled'] = isEnrolled;
    return data;
  }
}
