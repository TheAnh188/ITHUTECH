class StandingsResponse {
  List<Standing>? standing;

  StandingsResponse({this.standing});

  StandingsResponse.fromJson(Map<String, dynamic> json) {
    if (json['standing'] != null) {
      standing = <Standing>[];
      json['standing'].forEach((v) {
        standing!.add(Standing.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (standing != null) {
      data['standing'] = standing!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Standing {
  int? id;
  String? nickname;
  String? score;

  Standing({this.id, this.nickname, this.score});

  Standing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nickname'] = nickname;
    data['score'] = score;
    return data;
  }
}
