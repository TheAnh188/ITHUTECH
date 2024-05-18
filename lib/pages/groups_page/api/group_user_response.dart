class GroupUserResponse {
  List<GroupUser>? groupUser;

  GroupUserResponse({this.groupUser});

  GroupUserResponse.fromJson(Map<String, dynamic> json) {
    if (json['groupUser'] != null) {
      groupUser = <GroupUser>[];
      json['groupUser'].forEach((v) {
        groupUser!.add(GroupUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (groupUser != null) {
      data['groupUser'] = groupUser!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupUser {
  int? id;
  String? className;
  String? nickname;
  int? totalProblems;
  double? totalScore;
  int? totalSolutions;

  GroupUser(
      {this.id,
      this.className,
      this.nickname,
      this.totalProblems,
      this.totalScore,
      this.totalSolutions});

  GroupUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    className = json['class_name'];
    nickname = json['nickname'];
    totalProblems = json['total_problems'];
    totalScore = json['total_score'];
    totalSolutions = json['total_solutions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['class_name'] = className;
    data['nickname'] = nickname;
    data['total_problems'] = totalProblems;
    data['total_score'] = totalScore;
    data['total_solutions'] = totalSolutions;
    return data;
  }
}
